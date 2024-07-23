<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*, com.bankapp.model.Transaction, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction History</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa; /* Set background color for the entire page */
            margin: 0;
            padding: 0;
        }
        .header {
            background-color:#003366;
            color: #ffffff;
            padding: 1rem;
            text-align: center;
            font-size: 1.5rem;
        }
        .container {
            padding: 2rem;
            max-width: 900px;
            margin: 2rem auto;
            background-color: white; /* Container background color */
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1.5rem;
        }
        table, th, td {
            border: 1px solid #e1e4e8;
        }
        th, td {
            padding: 0.75rem 1rem;
            text-align: left;
        }
        th {
            background-color: #003366;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .action {
            text-align: center;
        }
        .action a {
            padding: 0.5rem 1rem;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        .action a:hover {
            background-color: #c82333;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.23/jspdf.plugin.autotable.min.js"></script>
    <script>
        function generatePDF() {
            const { jsPDF } = window.jspdf;
            const doc = new jsPDF();

            doc.text("Transaction History", 14, 16);

            const table = document.getElementById("transactionTable");
            const rows = table.querySelectorAll("tr");

            const data = [];
            const headers = [];

            rows.forEach((row, rowIndex) => {
                const cells = row.querySelectorAll("th, td");
                const rowData = [];

                cells.forEach(cell => {
                    rowData.push(cell.innerText);
                });

                if (rowIndex === 0) {
                    headers.push(rowData);
                } else {
                    data.push(rowData);
                }
            });

            doc.autoTable({
                head: headers,
                body: data,
                styles: { fontSize: 8, cellPadding: 2, overflow: 'linebreak' },
                headStyles: { fillColor: [0, 51, 102], textColor: [255, 255, 255] },
                alternateRowStyles: { fillColor: [248, 249, 250] }
            });

            doc.save("transaction_history.pdf");
        }
    </script>
</head>
<body>
    <div class="header">
        <h1>Transaction History</h1>
    </div>
    <div class="container">
        <table id="transactionTable">
            <thead>
                <tr>
                    <th>Transaction ID</th>
                    <th>Date</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Balance</th>
                    <th>Account No</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        String DB_URL = "jdbc:mysql://localhost:3306/trustbank";
                        String DB_USERNAME = "root";
                        String DB_PASSWORD = "1924";

                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM transactions ORDER BY  transaction_date DESC LIMIT 10"; // Adjust query as per your database schema
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int transactionId = rs.getInt("transaction_id");
                            String transactionDate = rs.getString("transaction_date");
                            String sentOrReceived = rs.getString("sent_or_received");
                            double amount = rs.getDouble("amount");
                            double balance = rs.getDouble("balance");
                            String accNo = rs.getString("acc_no");

                            out.println("<tr>");
                            out.println("<td>" + transactionId + "</td>");
                            out.println("<td>" + transactionDate + "</td>");
                            out.println("<td>" + sentOrReceived + "</td>");
                            out.println("<td>" + amount + "</td>");
                            out.println("<td>" + balance + "</td>");
                            out.println("<td>" + accNo + "</td>");
                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
        <!-- Download button -->
        <div style="text-align: center; margin-top: 1rem;">
            <button type="button" onclick="generatePDF()" style="padding: 0.5rem 1rem; background-color: #28a745; color: white; border-radius: 4px; border: none; cursor: pointer;">
                Download Transaction History
            </button>
        </div>
        <!-- Back button or link -->
        <div style="text-align: center; margin-top: 1rem;">
            <a href="customer_dashboard.jsp" style="padding: 0.5rem 1rem; background-color: #007bff; color: white; border-radius: 4px; text-decoration: none;">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
