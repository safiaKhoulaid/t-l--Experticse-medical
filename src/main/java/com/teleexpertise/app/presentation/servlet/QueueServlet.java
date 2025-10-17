package com.teleexpertise.app.presentation.servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.teleexpertise.app.application.service.QueueService;
import com.teleexpertise.app.domain.model.Queue;
import com.teleexpertise.app.domain.model.enums.Priority;
import com.teleexpertise.app.infrastructure.persistence.jpa.QueueRepositoryJpa;
import com.teleexpertise.app.presentation.servlet.adapter.LocalDateAdapter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/queue/*")
public class QueueServlet extends HttpServlet {

    private final QueueService queueService = new QueueService(new QueueRepositoryJpa());
    private final Gson gson = new Gson();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        String pathInfo = request.getPathInfo();

        try {
            if (pathInfo == null || pathInfo.equals("/")) {
                // Obtenir tous les patients en attente
                List<Queue> waitingPatients = queueService.getWaitingPatients();
                response.getWriter().write(gson.toJson(waitingPatients));

            } else if (pathInfo.equals("/next")) {
                // Obtenir le prochain patient
                var nextPatient = queueService.getNextPatient();
                if (nextPatient.isPresent()) {
                    response.getWriter().write(gson.toJson(nextPatient.get()));
                } else {
                    response.getWriter().write("{\"message\":\"Aucun patient en attente\"}");
                }

            } else if (pathInfo.startsWith("/position/")) {
                // Obtenir la position d'un patient
                Long queueId = Long.parseLong(pathInfo.substring(10));
                int position = queueService.getPatientPosition(queueId);
                response.getWriter().write("{\"position\":" + position + "}");
            }

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        String pathInfo = request.getPathInfo();

        try {
            if (pathInfo.startsWith("/start/")) {
                // Commencer une consultation
                Long queueId = Long.parseLong(pathInfo.substring(7));
                Queue queue = queueService.startConsultation(queueId);
                response.getWriter().write(gson.toJson(queue));

            } else if (pathInfo.startsWith("/complete/")) {
                // Terminer une consultation
                Long queueId = Long.parseLong(pathInfo.substring(10));
                Queue queue = queueService.completeConsultation(queueId);
                response.getWriter().write(gson.toJson(queue));

            } else if (pathInfo.startsWith("/cancel/")) {
                // Annuler une consultation
                Long queueId = Long.parseLong(pathInfo.substring(8));
                String reason = request.getParameter("reason");
                Queue queue = queueService.cancelConsultation(queueId, reason);
                response.getWriter().write(gson.toJson(queue));
            }

        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
        }
    }
}