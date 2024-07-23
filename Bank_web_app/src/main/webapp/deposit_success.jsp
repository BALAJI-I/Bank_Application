<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deposit Successful</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .container h2 {
            color: #28a745;
        }
        .container p {
            font-size: 1.2rem;
            color: #333;
        }
        .container a {
            display: inline-block;
            margin-top: 1rem;
            padding: 0.5rem 1rem;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .container a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Deposit Successful</h2>
        <%
            String accountNo = (String) session.getAttribute("customerAccountNo");
            double initialBalance = 0.0;
            double currentBalance = 0.0;

            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            try {
                String DB_URL = "jdbc:mysql://localhost:3306/trustbank";
                String DB_USERNAME = "root";
                String DB_PASSWORD = "1924";

                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

                // Fetch initial and current balance from the database
                String sql = "SELECT initial_balance, balance FROM customers WHERE account_number = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, accountNo);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    initialBalance = rs.getDouble("initial_balance");
                    currentBalance = rs.getDouble("balance");
                }

                // Calculate the combined balance
                double combinedBalance = initialBalance ;
                
                // Format the combined balance in Indian currency
                NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));
                String formattedCombinedBalance = currencyFormatter.format(combinedBalance);
        %>
        <p>Your  balance is: <%= formattedCombinedBalance %></p>
        <a href="customer_dashboard.jsp">Back to Dashboard</a>
        <%
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </div>
</body>
</html>
