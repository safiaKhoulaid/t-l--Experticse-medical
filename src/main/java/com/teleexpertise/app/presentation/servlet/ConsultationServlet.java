// File: src/main/java/com/teleexpertise/app/presentation/servlet/ConsultationServlet.java
package com.teleexpertise.app.presentation.servlet;

import com.teleexpertise.app.application.service.ConsultationService;
import com.teleexpertise.app.application.service.QueueService;
import com.teleexpertise.app.application.service.RequeteService;
import com.teleexpertise.app.application.service.UserService;
import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.infrastructure.persistence.jpa.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;

@WebServlet(name = "ConsultationServlet", urlPatterns = {"/consultation"})
public class ConsultationServlet extends HttpServlet {

    // Services
    private ConsultationService consultationService = new ConsultationService(new ConsultationRepositoryJpa(), new MedicalRecordJpa());
    private UserService userService = new UserService(new UserRepositoryJpa());
    private QueueService queueService = new QueueService(new QueueRepositoryJpa());
    private RequeteService expertiseService = new RequeteService(new RequeteRepositoryJpa());

    // Méthode utilitaire pour définir un message flash
    private void setFlash(HttpServletRequest req, String message, String type) {
        req.getSession().setAttribute("flashMessage", message);
        req.getSession().setAttribute("flashType", type); // "success" ou "error"
    }

    // Méthode utilitaire pour sécuriser la récupération des paramètres
    private String safe(String s) {
        return s == null ? "" : s.trim();
    }

    // Gestion des requêtes POST
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String action = safe(req.getParameter("action"));

        try {
            if ("closeConsultation".equals(action)) {
                // récupérer champs
                String medicalRecordId = safe(req.getParameter("medicalRecordId"));
                String motif = safe(req.getParameter("motif"));
                String observations = safe(req.getParameter("observations"));
                String diagnosis = safe(req.getParameter("diagnosis"));
                String treatment = safe(req.getParameter("treatment"));
                String generalistId = safe(req.getParameter("generalistId"));
                String queueId = safe(req.getParameter("queueId"));
                String priority = safe(req.getParameter("priority"));
                BigDecimal cout = BigDecimal.ZERO;
                try {
                    cout = safe(req.getParameter("cout")).isEmpty() ? BigDecimal.ZERO : new BigDecimal(safe(req.getParameter("cout")));
                } catch (Exception ignored) {
                }

                //recuperer le MedicalRecord et le Generalist pour vérification
                MedicalRecord medicalRecord = consultationService.getMedicalRecordById(medicalRecordId);
                User medecin = userService.getUserById(generalistId);

                // créer consultation marquée TERMINEE
                consultationService.createConsultation(medicalRecord, medecin, motif, observations, diagnosis, treatment,priority, "TERMINEE",cout);

                // fermer la queue si fournie
                if (!queueId.isEmpty()) queueService.closeQueue(queueId);

                // message de succès et redirection
                setFlash(req, "Consultation clôturée avec succès.", "success");
                resp.sendRedirect(req.getContextPath() + "/dashboard-medecin");
                return;

            } else if ("askExpertise".equals(action)) {

                String specialty = safe(req.getParameter("specialty"));
                String question = safe(req.getParameter("question"));
                String specialistId = safe(req.getParameter("specialistId"));
                String medicalRecordId = safe(req.getParameter("medicalRecordId"));
                String generalistId = safe(req.getParameter("generalistId"));
                double cout = 0;
                try {
                    cout = Double.parseDouble(safe(req.getParameter("cout")));
                } catch (Exception ignored) {
                }

                // Si modal incomplet -> rediriger vers formulaire d'expertise (optionnel)
                if (specialty.isEmpty() && specialistId.isEmpty()) {
                    // forward ou redirect vers page de création de requête d'expertise
                    resp.sendRedirect(req.getContextPath() + "/expertise-form?medicalRecordId=" + medicalRecordId);
                    return;
                }

                // créer la demande d'expertise (status EN_ATTENTE_AVIS_EXPERT)
//                String requestId = expertiseService.createExpertRequest(medicalRecordId, specialty, question, specialistId, generalistId);

                // créer consultation liée avec statut attente
//                consultationService.createConsultationWithRequest(medicalRecordId, generalistId, "Demande d'avis: " + specialty, question, null, cout, "EN_ATTENTE_AVIS_EXPERT", requestId);

                setFlash(req, "Demande d'expertise envoyée. Statut : en attente d'avis.", "success");
                resp.sendRedirect(req.getContextPath() + "/dashboard-medecin");
                return;
            } else {
                setFlash(req, "Action inconnue : " + action, "error");
                resp.sendRedirect(req.getContextPath() + "/dashboard-medecin");
                return;
            }
        } catch (Exception e) {
            setFlash(req, "Erreur serveur : " + e.getMessage(), "error");
            resp.sendRedirect(req.getContextPath() + "/dashboard-medecin");
        }
    }
}
