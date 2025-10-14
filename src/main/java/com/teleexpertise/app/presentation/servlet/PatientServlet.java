package com.teleexpertise.app.presentation.servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.teleexpertise.app.config.log.LoggerConfig;
import com.teleexpertise.app.domain.model.Patient;
import com.teleexpertise.app.presentation.servlet.adapter.InstantAdapter;
import com.teleexpertise.app.presentation.servlet.adapter.LocalDateAdapter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.apache.logging.log4j.Logger;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.Instant;
import java.time.LocalDate;

@WebServlet("/patient")
public class PatientServlet extends HttpServlet {
    private static final Logger logger = LoggerConfig.getLogger(PatientServlet.class);

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logger.info("hsfsdknsjwgbnwxvfnhfh");
        System.out.println("hello , servlet entree");
        response.setContentType("application/json");
        logger.info("📩 Requête POST reçue sur /patient");

        try {
            // --- Étape 1 : lecture du corps JSON ---
            System.out.println("hello , servlet entree dans try");
            StringBuilder sb = new StringBuilder();
            try (BufferedReader reader = request.getReader()) {
                System.out.println("hello , servlet entree dans try 2");
                String line;
                while ((line = reader.readLine()) != null) {
                    sb.append(line);
                }
            }
            String jsonString = sb.toString();
            logger.info("🔍 Corps JSON reçu : {}", jsonString);

            // --- Étape 2 : parsing avec Gson + LocalDateAdapter ---
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(LocalDate.class, new LocalDateAdapter())
                    .registerTypeAdapter(Instant.class, new InstantAdapter())
                    .create();


            Patient patient = gson.fromJson(jsonString, Patient.class);
            System.out.println("patient : " + patient);
            if (patient == null) {
                logger.error("❌ Parsing échoué : objet Patient null !");
                throw new IllegalArgumentException("JSON invalide ou vide");
            }

            logger.info("✅ Patient reçu : {} {}", patient.getFirstName(), patient.getLastName());

            // --- Étape 3 : traitement / enregistrement ---
            // Exemple : PatientDAO.save(patient);
            logger.debug("💾 Sauvegarde du patient dans la base (simulation)");

            // --- Étape 4 : réponse client ---
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"message\":\"Patient enregistré avec succès !\"}");
            logger.info("📤 Réponse envoyée avec succès au client.");

        } catch (Exception e) {
            logger.error("🔥 Erreur lors du traitement de la requête POST /patient", e);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }


}



