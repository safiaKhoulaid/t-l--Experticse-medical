// java
package com.teleexpertise.app.presentation.servlet;

import com.teleexpertise.app.application.service.ConsultationService;
import com.teleexpertise.app.application.service.QueueService;
import com.teleexpertise.app.application.service.UserService;
import com.teleexpertise.app.domain.model.Consultation;
import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.Queue;
import com.teleexpertise.app.domain.model.enums.QueueStatus;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.infrastructure.persistence.jpa.ConsultationRepositoryJpa;
import com.teleexpertise.app.infrastructure.persistence.jpa.MedicalRecordJpa;
import com.teleexpertise.app.infrastructure.persistence.jpa.QueueRepositoryJpa;
import com.teleexpertise.app.infrastructure.persistence.jpa.UserRepositoryJpa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ConsultationServlet", urlPatterns = {"/consultation"})
public class ConsultationServlet extends HttpServlet {

    private ConsultationService consultationService = new ConsultationService(new ConsultationRepositoryJpa(), new MedicalRecordJpa());
    private UserService userService = new UserService(new UserRepositoryJpa());
    private QueueService queueService = new QueueService(new QueueRepositoryJpa());

    private void setFlash(HttpServletRequest req, String message, String type) {
        req.getSession().setAttribute("flashMessage", message);
        req.getSession().setAttribute("flashType", type); // "success" ou "error"
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Récupération défensive des paramètres
            String medicalRecordId = safe(request.getParameter("medicalRecordId"));
            String generalistId = safe(request.getParameter("generalistId"));
            String motif = safe(request.getParameter("motif"));
            String observations = safe(request.getParameter("observations"));
            String diagnosis = safe(request.getParameter("diagnosis"));
            String treatment = safe(request.getParameter("treatment"));
            String priorityStr = safe(request.getParameter("priority"));
            String queueId = safe(request.getParameter("queueId"));
            String coutStr = safe(request.getParameter("cout"));
            String action = safe(request.getParameter("action"));

            long cout = 0L;
            try { cout = Long.parseLong(coutStr); } catch (NumberFormatException ignored) {}

            String status = "Terminee";

            // Récupération des objets métier
            MedicalRecord record = consultationService.getMedicalRecordById(medicalRecordId);
            User generalist = userService.getUserById(generalistId);

            if (queueId != null && !queueId.isEmpty()) {
                Queue queue = queueService.getQueueById(queueId);
                if (queue != null) {
                    queue.setStatus(QueueStatus.COMPLETED);
                    queueService.updateQueue(queue);
                }
            }

            if ("askExpertise".equals(action)) {
                status = "EN_ATTENTE_AVIS_SPECIALISTE";
            }

            Consultation consultation = consultationService.createConsultation(
                    record,
                    generalist,
                    motif,
                    observations,
                    diagnosis,
                    treatment,
                    priorityStr,
                    status
            );

            // message flash
            setFlash(request, "Consultation créée avec succès !", "success");

            // Si demande d'avis -> rediriger vers la route de requête (éviter double-forward)
            if ("askExpertise".equals(action)) {
                // Si vous devez fournir des paramètres à /requete, ajoutez-les à l'URL
                response.sendRedirect(request.getContextPath() + "/requete");
                return;
            }

            // redirection vers le dashboard (mapping existant)
            response.sendRedirect(request.getContextPath() + "/dashboard-medecin");
            return;

        } catch (Exception e) {
            setFlash(request, "Erreur lors du traitement : " + e.getMessage(), "error");
            response.sendRedirect(request.getContextPath() + "/dashboard-medecin");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // rediriger vers la route /dashboard-medecin (assurée par une servlet ou JSP accessible)
        response.sendRedirect(request.getContextPath() + "/dashboard-medecin");
    }

    private String safe(String s) {
        return s == null ? "" : s;
    }
}
