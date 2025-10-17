package com.teleexpertise.app.presentation.servlet;

import com.google.gson.*;
import com.teleexpertise.app.application.service.*;
import com.teleexpertise.app.config.log.LoggerConfig;
import com.teleexpertise.app.domain.model.*;
import com.teleexpertise.app.domain.model.enums.Priority;
import com.teleexpertise.app.infrastructure.persistence.jpa.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.Logger;

import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

@WebServlet("/dashboard-infirmiere")
public class PatientServlet extends HttpServlet {

    private static final Logger logger = LoggerConfig.getLogger(PatientServlet.class);

    private final PatientSerice patientService = new PatientSerice(new PatientRepositoryJpa());
    private final MedicalRecordService medicalRecordService = new MedicalRecordService(new MedicalRecordJpa());
    private final TreatementService treatmentService = new TreatementService(new TraitementRepositoryJpa());
    private final AntecedentService antecedentService = new AntecedentService(new AntecedentRepositoryJpa());
    private final AllergyService allergyService = new AllergyService(new AllergyRepositoryJpa());
    private final SigneVitauxService signeVitauxService = new SigneVitauxService(new SigneVitauxJpa());
    private final QueueService queueService = new QueueService(new QueueRepositoryJpa());
    private final Gson gson = new Gson();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");

        try {
            logger.info("=== [Début traitement POST /patient] ===");

            // ---------------------------
            // 1️⃣ Lecture du corps JSON
            // ---------------------------
            StringBuilder sb = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                String line;
                while ((line = reader.readLine()) != null) sb.append(line);
            }
            String jsonString = sb.toString();
            logger.info("📥 Corps JSON reçu : {}", jsonString);

            JsonObject jsonObject = JsonParser.parseString(jsonString).getAsJsonObject();

            // ---------------------------
            // 2️⃣ Extraction des données Patient
            // ---------------------------
            logger.info("➡️ Extraction des données du patient...");
            String firstName = jsonObject.get("prenom").getAsString();
            String lastName = jsonObject.get("nom").getAsString();
            LocalDate birthDate = LocalDate.parse(jsonObject.get("dateNaissance").getAsString());
            String numSec = jsonObject.get("numSecu").getAsString();
            String phone = jsonObject.has("telephone") ? jsonObject.get("telephone").getAsString() : "";
            String mutuelle = jsonObject.get("mutuelle").getAsString();
            String adresse = jsonObject.get("adresse").getAsString();
            String gender = jsonObject.get("sexe").getAsString();

            logger.info("✅ Patient extrait : {} {}, né le {}", firstName, lastName, birthDate);

            // ---------------------------
            // 3️⃣ Signes vitaux
            // ---------------------------
            logger.info("➡️ Extraction des signes vitaux...");
            JsonObject signesVitaux = jsonObject.has("signesVitaux") && jsonObject.get("signesVitaux").isJsonObject()
                    ? jsonObject.getAsJsonObject("signesVitaux")
                    : new JsonObject();

            BigDecimal tension = parseBigDecimal(signesVitaux, "tension");
            BigDecimal temperature = parseBigDecimal(signesVitaux, "temperature");
            BigDecimal poids = parseBigDecimal(signesVitaux, "poids");
            BigDecimal taille = parseBigDecimal(signesVitaux, "taille");

            Integer freqCard = parseInteger(signesVitaux, "freqCard");
            Integer freqResp = parseInteger(signesVitaux, "freqResp");
            logger.info("✅ Signes vitaux extraits : Taille={} Poids={} Tension={} Temp={} FC={} FR={}",
                    taille, poids, tension, temperature, freqCard, freqResp);


            Priority priority = Priority.MEDIUM; // Valeur par défaut
            Integer estimatedDuration = 30; // Valeur par défaut
            String priorityReason = "";

            if (jsonObject.has("priority") && !jsonObject.get("priority").isJsonNull()) {
                String priorityStr = jsonObject.get("priority").getAsString();
                priority = Priority.valueOf(priorityStr);
                System.out.println("✅ Priorité sélectionnée : " + priority.valueOf(priorityStr));
            }

            if (jsonObject.has("estimatedDuration") && !jsonObject.get("estimatedDuration").isJsonNull()) {
                estimatedDuration = jsonObject.get("estimatedDuration").getAsInt();
                System.out.println("✅ Durée estimée : " + estimatedDuration + " minutes");
            }

            if (jsonObject.has("priorityReason") && !jsonObject.get("priorityReason").isJsonNull()) {
                priorityReason = jsonObject.get("priorityReason").getAsString();
                System.out.println("✅ Raison de priorité : " + priorityReason);
            }
            // ---------------------------
            // 4️⃣ Création du Patient
            // ---------------------------
            logger.info("➡️ Création du patient...");
            Optional<Patient> patientOpt = patientService.createPatient(
                    firstName, lastName, phone, gender, mutuelle, adresse, numSec, birthDate
            );

            if (patientOpt.isEmpty()) {
                throw new Exception("Impossible de créer le patient");
            }
            Patient patient = patientOpt.get();
            logger.info("✅ Patient créé avec ID={}", patient.getId());

            // ---------------------------
            // 5️⃣ Création du dossier médical
            // ---------------------------
            logger.info("➡️ Création du dossier médical...");
            Optional<MedicalRecord> recordOpt = medicalRecordService.createMedicalRecord(patient);

            if (recordOpt.isEmpty()) {
                throw new Exception("Impossible de créer le dossier médical");
            }

            MedicalRecord record = recordOpt.get();
            logger.info("✅ Dossier médical créé avec ID={}", record.getId());


            Optional<VitalSign> vitalSignOpt = signeVitauxService.createVitalSign( record,
                    temperature, tension, taille, poids, freqCard, freqResp
            );

            if (vitalSignOpt.isPresent()) {
                logger.info("🩺 Signes vitaux enregistrés avec ID={}", vitalSignOpt.get().getId());
            } else if(vitalSignOpt.isEmpty()){
                logger.warn("⚠️ Impossible d’enregistrer les signes vitaux.");
            }
            // ---------------------------
            // 6️⃣ Sauvegarde des antécédents, allergies, traitements
            // ---------------------------
            Set<Antecedent> antecedents = createAndSaveAntecedents(jsonObject, patient, record);
            Set<Allergy> allergies = createAndSaveAllergies(jsonObject, patient, record);
            Set<Treatment> treatments = createAndSaveTreatments(jsonObject, patient, record);

            record.setAntecedents(antecedents);
            record.setAllergies(allergies);
            record.setTraitementsActuels(treatments);

            logger.info("✅ Données médicales associées (Antécédents={}, Allergies={}, Traitements={})",
                    antecedents.size(), allergies.size(), treatments.size());
            try{
                Queue queueEntry = queueService.addPatientToQueue(record, priority );
                List<Queue> listAttent = queueService.getWaitingPatients();
                request.setAttribute("queueAttent", listAttent );


                System.out.println("✅ Patient ajouté à la file d'attente :");
                System.out.println("   - Numéro : " + queueEntry.getQueueNumber());
                System.out.println("   - Priorité : " + queueEntry.getPriority().values());
            }catch(Exception e){
                logger.error("❌ Erreur lors de l'ajout du patient à la file d'attente : {}", e.getMessage(), e);
            }


            // ---------------------------
            // 7️⃣ Réponse JSON
            // ---------------------------
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("message", "✅ Patient enregistré avec succès !");
            jsonResponse.addProperty("id", patient.getId());
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(gson.toJson(jsonResponse));
            request.setAttribute("sucess", "Patient créé avec succès");
            logger.info("=== [Fin du traitement POST /patient — Succès] ===");

        } catch (Exception e) {
            logger.error("❌ Erreur lors du traitement POST /patient : {}", e.getMessage(), e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

            JsonObject errorResponse = new JsonObject();
            errorResponse.addProperty("error", e.getMessage());
            response.getWriter().write(gson.toJson(errorResponse));
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Récupérer les patients en attente via le service de file d'attente
        List<Queue> waitingPatients = queueService.getWaitingPatients();
        // Placer la liste dans la requête
        request.setAttribute("waitingPatients", waitingPatients);
        // Rediriger vers la JSP dashboard-infermier
        request.getRequestDispatcher("/dashboard-infermier.jsp").forward(request, response);
    }

    // ------------------------------------------------------------
    // 🔧 Méthodes utilitaires
    // ------------------------------------------------------------

    private BigDecimal getBigDecimal(JsonObject json, String key) {
        return (json.has(key) && !json.get(key).isJsonNull())
                ? json.get(key).getAsBigDecimal()
                : BigDecimal.ZERO;
    }

    private int getInt(JsonObject json, String key) {
        return (json.has(key) && !json.get(key).isJsonNull())
                ? json.get(key).getAsInt()
                : 0;
    }

    private Set<Antecedent> createAndSaveAntecedents(JsonObject json, Patient p, MedicalRecord r) {
        Set<Antecedent> result = new HashSet<>();
        if (json.has("antecedents") && !json.get("antecedents").isJsonNull()) {
            JsonArray array = json.getAsJsonArray("antecedents");
            logger.info("📂 Création de {} antécédents...", array.size());
            for (JsonElement el : array) {
                JsonObject obj = el.getAsJsonObject();
                if (obj.has("nom")) {
                    String name = obj.get("nom").getAsString();
                    String desc = obj.has("description") ? obj.get("description").getAsString() : "";
                    antecedentService.createAntecedent(r, name, desc)
                            .ifPresentOrElse(a -> {
                                result.add(a);
                                logger.info("🩸 Antécédent ajouté : {}", a.getTypeAntecedent());
                            }, () -> logger.warn("⚠️ Échec pour l’antécédent {}", name));
                }
            }
        }
        return result;
    }

    private Set<Treatment> createAndSaveTreatments(JsonObject json, Patient p, MedicalRecord r) {
        Set<Treatment> result = new HashSet<>();
        if (json.has("traitements") && !json.get("traitements").isJsonNull()) {
            JsonArray array = json.getAsJsonArray("traitements");
            logger.info("💊 Création de {} traitements...", array.size());
            for (JsonElement el : array) {
                JsonObject obj = el.getAsJsonObject();
                if (obj.has("nom")) {
                    String name = obj.get("nom").getAsString();
                    String desc = obj.has("description") ? obj.get("description").getAsString() : "";
                    treatmentService.createTreatment(r, name, desc)
                            .ifPresentOrElse(t -> {
                                result.add(t);
                                logger.info("💊 Traitement ajouté : {}", t.getTreatmentName());
                            }, () -> logger.warn("⚠️ Échec pour le traitement {}", name));
                }
            }
        }
        return result;
    }

    private Set<Allergy> createAndSaveAllergies(JsonObject json, Patient p, MedicalRecord r) {
        Set<Allergy> result = new HashSet<>();
        if (json.has("allergies") && !json.get("allergies").isJsonNull()) {
            JsonArray array = json.getAsJsonArray("allergies");
            logger.info("🤧 Création de {} allergies...", array.size());
            for (JsonElement el : array) {
                JsonObject obj = el.getAsJsonObject();
                if (obj.has("nom")) {
                    String name = obj.get("nom").getAsString();
                    String desc = obj.has("description") ? obj.get("description").getAsString() : "";
                    allergyService.createAllergy(r, name, desc)
                            .ifPresentOrElse(a -> {
                                result.add(a);
                                logger.info("🤧 Allergie ajoutée : {}", a.getAllergyName());
                            }, () -> logger.warn("⚠️ Échec pour l’allergie {}", name));
                }
            }
        }
        return result;
    }

    private BigDecimal parseBigDecimal(JsonObject obj, String key) {
        if (obj.has(key) && !obj.get(key).isJsonNull()) {
            String value = obj.get(key).getAsString().trim();
            try {
                if (value.matches("^-?\\d+(\\.\\d+)?$")) {
                    return new BigDecimal(value);
                } else {
                    logger.warn("⚠️ Valeur non numérique pour '{}': '{}'", key, value);
                }
            } catch (NumberFormatException e) {
                logger.warn("⚠️ Erreur de conversion BigDecimal pour '{}': {}", key, e.getMessage());
            }
        }
        return BigDecimal.ZERO; // valeur par défaut
    }

    private Integer parseInteger(JsonObject obj, String key) {
        if (obj.has(key) && !obj.get(key).isJsonNull()) {
            String value = obj.get(key).getAsString().trim();
            try {
                if (value.matches("^-?\\d+$")) {
                    return Integer.parseInt(value);
                } else {
                    logger.warn("⚠️ Valeur non entière pour '{}': '{}'", key, value);
                }
            } catch (NumberFormatException e) {
                logger.warn("⚠️ Erreur de conversion Integer pour '{}': {}", key, e.getMessage());
            }
        }
        return 0; // valeur par défaut
    }

}
