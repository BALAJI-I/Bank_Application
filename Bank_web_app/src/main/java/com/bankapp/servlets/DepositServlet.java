package com.bankapp.servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DepositServlet")
public class DepositServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String amountStr = request.getParameter("amount");
        String password = request.getParameter("deposit-password");
        String userName = (String) session.getAttribute("customerFullName");

        if (amountStr == null || amountStr.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            response.getWriter().println("Amount and password cannot be empty.");
            return;
        }

        BigDecimal amount;
        try {
            amount = new BigDecimal(amountStr.trim());
        } catch (NumberFormatException e) {
            response.getWriter().println("Invalid amount format.");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        PreparedStatement transactionStmt = null;
        ResultSet rs = null;
        long customerId = 0; // Initialize customerId

        try {
            String DB_URL = "jdbc:mysql://localhost:3306/trustbank";
            String DB_USERNAME = "root";
            String DB_PASSWORD = "1924";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            String validateUserQuery = "SELECT customer_id, initial_balance, email, account_number FROM customers WHERE full_name = ? AND temp_password = ?";
            stmt = conn.prepareStatement(validateUserQuery);
            stmt.setString(1, userName);
            stmt.setString(2, password);
            rs = stmt.executeQuery();

            if (rs.next()) {
                customerId = rs.getLong("customer_id");
                BigDecimal currentBalance = rs.getBigDecimal("initial_balance");
                String email = rs.getString("email");
                String accNo = rs.getString("account_number");

                BigDecimal newBalance = currentBalance.add(amount);
                String updateBalanceQuery = "UPDATE customers SET initial_balance = ? WHERE customer_id = ?";
                stmt = conn.prepareStatement(updateBalanceQuery);
                stmt.setBigDecimal(1, newBalance);
                stmt.setLong(2, customerId);
                stmt.executeUpdate();

                LocalDate transactionDate = LocalDate.now();
                String insertTransactionQuery = "INSERT INTO transactions (transaction_date, user_name, email, sent_or_received, amount, balance, acc_no) VALUES (?, ?, ?, ?, ?, ?, ?)";
                transactionStmt = conn.prepareStatement(insertTransactionQuery);
                transactionStmt.setObject(1, transactionDate);
                transactionStmt.setString(2, userName);
                transactionStmt.setString(3, email);
                transactionStmt.setString(4, "Received"); // Assuming this is a deposit scenario
                transactionStmt.setBigDecimal(5, amount);
                transactionStmt.setBigDecimal(6, newBalance);
                transactionStmt.setString(7, accNo);
                transactionStmt.executeUpdate();

                response.sendRedirect("deposit_success.jsp");
            } else {
                response.getWriter().println("Invalid password.");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("Exception occurred: " + e.getMessage());

        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (transactionStmt != null) transactionStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
