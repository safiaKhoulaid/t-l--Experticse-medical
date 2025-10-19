package com.teleexpertise.app.presentation.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class ExpertDashboardServlet  extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req , HttpServletResponse resp ) throws ServletException , IOException{
        getServletContext()
                .getRequestDispatcher("/dashboard-expert.jsp")
                .forward(req, resp);
    }
}
