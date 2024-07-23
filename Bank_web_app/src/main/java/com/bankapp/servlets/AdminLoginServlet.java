package com.bankapp.servlets;

import com.bankapp.services.AdminService;  // Make sure to import the AdminService class
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirect GET requests to the login page
        response.sendRedirect("Admin_login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AdminService adminService = new AdminService();
        boolean isValid = adminService.validateAdmin(username, password);

        if (isValid) {
            request.getSession().setAttribute("admin_username", username);
            response.sendRedirect("admin_dashboard.jsp");
        } else {
            request.setAttribute("errorMessage", "Invalid Credentials");
            request.getRequestDispatcher("Admin_login.jsp").forward(request, response);
        }
    }
}
