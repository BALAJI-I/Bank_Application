package com.bankapp.servlets;

import com.bankapp.services.CustomerService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");

        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("customerFullName");

        CustomerService customerService = new CustomerService();

        boolean passwordChanged = customerService.changePassword(userName, currentPassword, newPassword);

        if (passwordChanged) {
            // Redirect to a success page with a message
            response.sendRedirect("password_change_success.jsp");
        } else {
            // Redirect back to change password form with an error message
            response.sendRedirect("change_password.jsp?error=true");
        }
    }
}
