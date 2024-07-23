package com.bankapp.servlets;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/DownloadTransactionServlet")
public class DownloadTransactionsServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/csv");
        response.setHeader("Content-Disposition", "attachment; filename=\"transaction_history.csv\"");

        PrintWriter out = response.getWriter();

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String DB_URL = "jdbc:mysql://localhost:3306/trustbank";
            String DB_USERNAME = "root";
            String DB_PASSWORD = "1924";

            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

            // Retrieve HttpSession
            HttpSession session = request.getSession();
            String accountNo = (String) session.getAttribute("accountNo");

            // Prepare SQL statement to retrieve transactions for the logged-in account
            String sql = "SELECT * FROM transactions WHERE acc_no = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, accountNo);
            rs = stmt.executeQuery();

            // Generate CSV content
            out.println("Transaction ID,Date,Type,Amount,Balance,Account No");
            while (rs.next()) {
                int transactionId = rs.getInt("transaction_id");
                String transactionDate = rs.getString("transaction_date");
                String sentOrReceived = rs.getString("sent_or_received");
                double amount = rs.getDouble("amount");
                double balance = rs.getDouble("balance");
                String accNoFromDb = rs.getString("acc_no");

                out.println(transactionId + "," + transactionDate + "," + sentOrReceived + "," + amount + "," + balance + "," + accNoFromDb);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
                if (out != null) out.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
