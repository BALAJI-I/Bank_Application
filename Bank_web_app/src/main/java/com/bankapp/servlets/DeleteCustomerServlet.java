package com.bankapp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountId = request.getParameter("accountId");

        Connection conn = null;
        PreparedStatement stmtDeleteTransactions = null;
        PreparedStatement stmtDeleteCustomer = null;

        try {
            String DB_URL = "jdbc:mysql://localhost:3306/trustbank";
            String DB_USERNAME = "root";
            String DB_PASSWORD = "1924";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // First, delete transactions related to the customer
            String sqlDeleteTransactions = "DELETE FROM transactions WHERE acc_no=?";
            stmtDeleteTransactions = conn.prepareStatement(sqlDeleteTransactions);
            stmtDeleteTransactions.setString(1, accountId);
            stmtDeleteTransactions.executeUpdate();

            // Then, delete the customer
            String sqlDeleteCustomer = "DELETE FROM customers WHERE account_number=?";
            stmtDeleteCustomer = conn.prepareStatement(sqlDeleteCustomer);
            stmtDeleteCustomer.setString(1, accountId);

            int rowsDeleted = stmtDeleteCustomer.executeUpdate();
            if (rowsDeleted > 0) {
                response.sendRedirect("delete_update_list.jsp"); // Redirect to customer list after successful delete
            } else {
                response.getWriter().println("Failed to delete customer details.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Exception occurred: " + e.getMessage());

        } finally {
            try {
                if (stmtDeleteTransactions != null) stmtDeleteTransactions.close();
                if (stmtDeleteCustomer != null) stmtDeleteCustomer.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
