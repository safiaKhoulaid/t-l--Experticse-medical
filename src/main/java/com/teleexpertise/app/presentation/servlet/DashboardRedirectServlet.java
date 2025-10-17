package com.teleexpertise.app.presentation.servlet;


import com.teleexpertise.app.domain.model.user.Role;
import com.teleexpertise.app.domain.model.user.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardRedirectServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        Role role = user.getRole();

        switch (role) {
            case NURSE -> resp.sendRedirect(req.getContextPath() + "/dashboard-infirmiere");
            case DOCTOR_GENERAL -> resp.sendRedirect(req.getContextPath() + "/dashboard-medecin");
            case DOCTOR_SPECIALIST -> resp.sendRedirect(req.getContextPath() + "/dashboard-expert");
            default -> resp.sendRedirect(req.getContextPath() + "/login.jsp");
        }
    }
}
