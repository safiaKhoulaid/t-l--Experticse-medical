//package com.teleexpertise.app.presentation.servlet;
//
//import com.teleexpertise.app.application.service.PatientSerice;
//import com.teleexpertise.app.application.service.QueueService;
//import com.teleexpertise.app.domain.model.Queue;
//import com.teleexpertise.app.infrastructure.persistence.jpa.PatientRepositoryJpa;
//import com.teleexpertise.app.infrastructure.persistence.jpa.QueueRepositoryJpa;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/dashboard")
//public class DashboardServlet extends HttpServlet {
//
//    //Dévlaratiion des services nécessaires
//    PatientSerice patientService = new PatientSerice(new PatientRepositoryJpa());
//    QueueService queueService = new QueueService(new QueueRepositoryJpa());
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//
//        HttpSession session = request.getSession(false);
//        if (session == null || session.getAttribute("userRole") == null) {
//            response.sendRedirect("login.jsp");
//            return;
//        }
//
//        String role = (String) session.getAttribute("userRole").toString();
//
//
//        switch (role) {
//            case "NURSE":
//                List<Queue> listAttent = queueService.getWaitingPatients();
//                request.setAttribute("queueAttent", listAttent);
//                System.out.println("📋 Nombre de patients en attente : " + listAttent.size());
//
//                // Debug : afficher les patients
//
//
//                request.getRequestDispatcher("dashboard-infermier.jsp").forward(request, response);
//                break;
//            case "DOCTOR_GENERAL":
//
//                request.getRequestDispatcher("dashboard-medecin.jsp").forward(request, response);
//                break;
//            case "DOCTOR_SPECIALIST":
//                request.getRequestDispatcher("dashboard-expert.jsp").forward(request, response);
//                break;
//            case "ADMIN":
//                request.getRequestDispatcher("dashboard-admin.jsp").forward(request, response);
//                break;
//            default:
//                response.sendRedirect("login.jsp");
//        }
//    }
//}
