package com.teleexpertise.app.presentation.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userRole") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String role = (String) session.getAttribute("userRole").toString();

        switch (role) {
            case "NURSE":
                request.getRequestDispatcher("dashboard-infermier.jsp").forward(request, response);
                break;
            case "DOCTOR_GENERAL":

                request.getRequestDispatcher("dashboard-medecin.jsp").forward(request, response);
                break;
            case "DOCTOR_SPECIALIST":
                request.getRequestDispatcher("dashboard-expert.jsp").forward(request, response);
                break;
            case "ADMIN":
                request.getRequestDispatcher("dashboard-admin.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("login.jsp");
        }
    }
}
