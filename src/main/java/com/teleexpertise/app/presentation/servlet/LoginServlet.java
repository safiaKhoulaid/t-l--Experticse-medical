package com.teleexpertise.app.presentation.servlet;

import com.teleexpertise.app.application.service.AuthService;
import com.teleexpertise.app.domain.model.user.User;
import com.teleexpertise.app.infrastructure.persistence.jpa.UserRepositoryJpa;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Optional;
import java.util.logging.Logger;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final Logger log = Logger.getLogger(LoginServlet.class.getName());
    private final AuthService authService = new AuthService(new UserRepositoryJpa());


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Optional<User> userOpt = authService.login(email, password);

            if (userOpt.isPresent()) {
                // ✅ Connexion réussie
                User user = userOpt.get();

                HttpSession session = req.getSession();
                session.setAttribute("userLoggedIn", true);
                session.setAttribute("user", user);
                session.setAttribute("userRole", user.getRole()); // ex: "INFERMIER", "MEDECIN", "EXPERT", "ADMIN"


                log.info("User logged in successfully: " + user.getEmail());

                // Redirection vers la page d’accueil
                res.sendRedirect(req.getContextPath() + "/index.jsp");

            } else {
                // ❌ Email inexistant ou mot de passe incorrect
                log.warning("Login failed for email: " + email);
                req.setAttribute("error", "Email ou mot de passe incorrect.");
                getServletContext().getRequestDispatcher("/login.jsp").forward(req, res);
            }

        } catch (IllegalArgumentException e) {
            // Email invalide ou données incorrectes
            log.warning("Login validation error: " + e.getMessage());
            req.setAttribute("error", "Données de connexion invalides. Veuillez vérifier votre email et mot de passe.");
            getServletContext().getRequestDispatcher("/login.jsp").forward(req, res);

        } catch (Exception e) {
            // Autres erreurs imprévues
            log.severe("Unexpected error during login: " + e.getMessage());
            req.setAttribute("error", "Une erreur inattendue est survenue. Veuillez réessayer plus tard.");
            getServletContext().getRequestDispatcher("/login.jsp").forward(req, res);
        }
    }



    @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse res)
                throws ServletException, IOException {
            getServletContext()
                    .getRequestDispatcher("/login.jsp")
                    .forward(req, res);
        }
    }

