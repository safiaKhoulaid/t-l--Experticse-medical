package com.teleexpertise.app.presentation.servlet;


import com.teleexpertise.app.application.service.AuthService;
import com.teleexpertise.app.infrastructure.persistence.jpa.UserRepositoryJpa;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private final AuthService authService = new AuthService(new UserRepositoryJpa());

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, java.io.IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        var user = authService.login(email, password);
        if (user != null) {
            req.getSession().setAttribute("user", user);
            res.sendRedirect("home.jsp");
        } else {
            req.setAttribute("error", "Email ou mot de passe incorrect");
            req.getRequestDispatcher("login.jsp").forward(req, res);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, java.io.IOException {
        req.getRequestDispatcher("login.jsp").forward(req, res);
    }
}

