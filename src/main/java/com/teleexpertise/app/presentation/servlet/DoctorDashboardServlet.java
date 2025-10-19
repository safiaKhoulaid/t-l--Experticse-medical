package com.teleexpertise.app.presentation.servlet;

import com.teleexpertise.app.application.service.*;
import com.teleexpertise.app.domain.model.Specialty;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.infrastructure.persistence.jpa.ExpertRepositoryJpa;
import com.teleexpertise.app.infrastructure.persistence.jpa.PatientRepositoryJpa;
import com.teleexpertise.app.infrastructure.persistence.jpa.QueueRepositoryJpa;
import com.teleexpertise.app.infrastructure.persistence.jpa.SpecialtyRepositoryJpa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import com.teleexpertise.app.domain.model.Queue;

@WebServlet(name = "DoctorDashboardServlet", urlPatterns = {"/dashboard-medecin", "/doctor-dashboard"})
public class DoctorDashboardServlet extends HttpServlet {
    private PatientSerice patientService = new PatientSerice(new PatientRepositoryJpa());
    private ConsultationService consultationService;
    private QueueService queueService;
    private SpecialityService specialityService = new SpecialityService(new SpecialtyRepositoryJpa());
    private ExpertService expertService = new ExpertService(new ExpertRepositoryJpa());

    @Override
    public void init() throws ServletException {
        super.init();
        // Initialisation manuelle (préférer injection en production)
        this.queueService = new QueueService(new QueueRepositoryJpa());
        // Si nécessaire, initialiser consultationService ici de la même manière
        // this.consultationService = new ConsultationService(...);
    }

    
    @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Queue> queuesList = queueService.getWaitingPatients();
        List<Specialty> specialities= specialityService.getAllSpecialties();
        List<User>expertes = expertService.findAllExperts();
        req.setAttribute("specialities", specialities);
        req.setAttribute("expertes", expertes);
        req.setAttribute("queuesList", queuesList);
        getServletContext()
                .getRequestDispatcher("/dashboard-medecin.jsp")
                .forward(req, resp);

    }
}