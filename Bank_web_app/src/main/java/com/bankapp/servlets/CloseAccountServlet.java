package com.bankapp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bankapp.services.DatabaseConnection;

@WebServlet("/CloseAccountServlet")
public class CloseAccountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userName = (String) session.getAttribute("customerFullName");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();

            // Check for pending transactions
            String checkTransactionsQuery = "SELECT COUNT(*) AS transactionCount FROM transactions WHERE acc_no = ?";
            stmt = conn.prepareStatement(checkTransactionsQuery);
            stmt.setString(1, userName); // Assuming acc_no is the username in this case
            rs = stmt.executeQuery();

            if (rs.next()) {
                int transactionCount = rs.getInt("transactionCount");
                if (transactionCount > 0) {
                    // If there are pending transactions, reject account closure
                    response.getWriter().println("Account closure requires no pending transactions. Please contact customer support.");
                    return;
                }
            }

            // Disable foreign key checks
            stmt.executeUpdate("SET FOREIGN_KEY_CHECKS=0;");

            // Delete customer record
            String deleteAccountQuery = "DELETE FROM customers WHERE full_name = ?";
            stmt = conn.prepareStatement(deleteAccountQuery);
            stmt.setString(1, userName);
            stmt.executeUpdate();

            // Enable foreign key checks
            stmt.executeUpdate("SET FOREIGN_KEY_CHECKS=1;");

            response.sendRedirect("account_closed.jsp"); // Redirect to account closure success page

        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Exception occurred: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
