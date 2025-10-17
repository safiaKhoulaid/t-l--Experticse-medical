package com.teleexpertise.app.presentation.servlet;

import com.teleexpertise.app.application.service.ConsultationService;
import com.teleexpertise.app.application.service.UserService;
import com.teleexpertise.app.domain.model.Consultation;
import com.teleexpertise.app.domain.model.MedicalRecord;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.infrastructure.persistence.jpa.ConsultationRepositoryJpa;
import com.teleexpertise.app.infrastructure.persistence.jpa.MedicalRecordJpa;
import com.teleexpertise.app.infrastructure.persistence.jpa.UserRepositoryJpa;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ConsultationServlet", urlPatterns = "/consultation")
public class ConsultationServlet extends HttpServlet {


    private ConsultationService consultationService = new ConsultationService(new ConsultationRepositoryJpa() , new MedicalRecordJpa());
    private UserService userService = new UserService(new UserRepositoryJpa());

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
            long cout = Long.parseLong(request.getParameter("cout"));

            System.out.println("Received consultation data: " +
                    "medicalRecordId=" + medicalRecordId +
                    ", generalistId=" + generalistId +
                    ", motif=" + motif +
                    ", observations=" + observations +
                    ", diagnosis=" + diagnosis +
                    ", treatment=" + treatment +
                    ", priority=" + priorityStr +
                    ", cout=" + cout);

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
            getServletContext().getRequestDispatcher("/dashboard-medecin").forward(request, response);

        } catch (Exception e) {
            // Gestion des erreurs
            request.setAttribute("errorMessage", e.getMessage());
            getServletContext().getRequestDispatcher("/dashboard-medecin").forward(request, response);
        }
    }


}
