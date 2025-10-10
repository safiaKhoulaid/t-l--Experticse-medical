package com.teleexpertise.app.infrastructure.filter;



import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter("/home.jsp")
public class AuthFilter implements Filter {
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        if (req.getSession().getAttribute("user") == null) {
            ((HttpServletResponse) response).sendRedirect("login.jsp");
            return;
        }
        chain.doFilter(request, response);
    }
}
