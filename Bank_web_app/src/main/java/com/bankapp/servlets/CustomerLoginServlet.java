package com.bankapp.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accountNo = request.getParameter("accountNo");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        String fullName = "";
        String address = "";
        double initialBalance = 0.0;
        double currentBalance = 0.0;

        try {
            String DB_URL = "jdbc:mysql://localhost:3306/trustbank";
            String DB_USERNAME = "root";
            String DB_PASSWORD = "1924";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // Query to retrieve customer details and initial balance directly from customers table
            String sql = "SELECT full_name, address, balance " +
                         "FROM customers " +
                         "WHERE account_number = ? AND temp_password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, accountNo);
            stmt.setString(2, password);

            rs = stmt.executeQuery();

            if (rs.next()) {
                fullName = rs.getString("full_name");
                address = rs.getString("address");
                currentBalance = rs.getDouble("balance");

                // Set initial balance to current balance initially
                initialBalance = currentBalance;

                HttpSession session = request.getSession();
                session.setAttribute("customerAccountNo", accountNo);
                session.setAttribute("customerFullName", fullName);
                session.setAttribute("initialBalance", initialBalance);
                session.setAttribute("currentBalance", currentBalance);

                response.sendRedirect("customer_dashboard.jsp");
            } else {
                response.getWriter().println("Invalid account number or password.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Exception occurred: " + e.getMessage());
        } finally {
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
