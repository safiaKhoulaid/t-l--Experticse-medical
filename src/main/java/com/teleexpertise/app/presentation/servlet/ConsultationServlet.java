package com.teleexpertise.app.presentation.servlet;

import com.teleexpertise.app.application.service.ConsultationService;
import com.teleexpertise.app.application.service.UserService;
import com.teleexpertise.app.domain.model.Consultation;
import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.user.User;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ConsultationServlet", urlPatterns = "/consultation/create")
public class ConsultationServlet extends HttpServlet {

    @Inject
    private ConsultationService consultationService;
    private UserService userService;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Récupération des paramètres du formulaire
            String medicalRecordId = request.getParameter("medicalRecordId").toString();
            String generalistId   = request.getParameter("generalistId").toString();
            String motif        = request.getParameter("motif");
            String observations = request.getParameter("observations");
            String diagnosis    = request.getParameter("diagnosis");
            String treatment    = request.getParameter("treatment");
            String priorityStr  = request.getParameter("priority");

            // Récupération des objets (mock ou via repository/service)
            MedicalRecord record = consultationService.getMedicalRecordById(medicalRecordId);
            User generalist = userService.getUserById(generalistId);

            // Création de la consultation
            Consultation consultation = consultationService.createConsultation(
                    record,
                    generalist,
                    motif,
                    observations,
                    diagnosis,
                    treatment,
                    priorityStr
            );

            // Redirection vers JSP succès
            request.setAttribute("consultation", consultation);
            request.setAttribute("successMessage", "Consultation créée avec succès !");
            request.getRequestDispatcher("/WEB-INF/jsp/consultationSuccess.jsp").forward(request, response);

        } catch (Exception e) {
            // Gestion des erreurs
            request.setAttribute("errorMessage", e.getMessage());
            request.getRequestDispatcher("/WEB-INF/jsp/consultationForm.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirige vers le formulaire de création de consultation
        request.getRequestDispatcher("/WEB-INF/jsp/consultationForm.jsp").forward(request, response);
    }
}
