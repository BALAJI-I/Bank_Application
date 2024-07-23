<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%
    // Ensure a session exists or create one
    String accountNo = (String) session.getAttribute("customerAccountNo");

    // If account number is not set in the session, redirect to login page or show an error message
    if (accountNo == null) {
        response.sendRedirect("customer_login.jsp");
        return;
    }

    // Variables to store customer information
    String fullName = "";
    String address = "";
    double initialBalance = 0.0;

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    try {
        String DB_URL = "jdbc:mysql://localhost:3306/trustbank";
        String DB_USERNAME = "root";
        String DB_PASSWORD = "1924";

        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

        String sql = "SELECT full_name,  initial_balance FROM customers WHERE account_number = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, accountNo);
        rs = stmt.executeQuery();

        if (rs.next()) {
            fullName = rs.getString("full_name");
            
            initialBalance = rs.getDouble("initial_balance");
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

    NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));
    String formattedInitialBalance = currencyFormatter.format(initialBalance);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .navbar {
            display: flex;
            background-color: #003366;
            color: white;
            padding: 1rem;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h2 {
            margin: 0;
        }
        .navbar ul {
            list-style: none;
            padding: 0;
            display: flex;
            margin: 0;
        }
        .navbar ul li {
            margin-left: 2rem;
        }
        .navbar ul li a {
            color: white;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 4px;
        }
        .navbar ul li a:hover {
            background-color: #0056b3;
        }
        .container {
            padding: 2rem;
        }
        .header {
            background-color: #003366;
            color: white;
            padding: 1rem;
            text-align: center;
            margin-bottom: 2rem;
        }
        .dashboard-options {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .dashboard-options a {
            background-color: #003366;
            color: white;
            padding: 1rem;
            margin: 0.5rem;
            text-decoration: none;
            border-radius: 5px;
            width: 200px;
            text-align: center;
        }
        .dashboard-options a:hover {
            background-color: #004080;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h2>Welcome, <%= fullName %></h2>
        <ul>
            <li><a href="#">Account No: <%= accountNo %></a></li>
            <li><a href="change_password.jsp">Change Password</a></li>
            <li><a href="notifications.jsp">Notifications</a></li>
            <li><a href="help.jsp">Help</a></li>
            <li><a href="close_account.jsp">Close Account</a></li>
            <li><a href="mainlogin.jsp">Logout</a></li>
        </ul>
    </div>
    <div class="container">
        <div class="header">
            <h1>Customer Dashboard</h1>
        </div>
        
        <h3>Initial Balance: <%= formattedInitialBalance %></h3>
        <div class="dashboard-options">
            
            <a href="withdraw.jsp">Withdraw</a>
            <a href="deposit.jsp">Deposit</a>
            <a href="transactionhistory.jsp">Transaction History</a>
            
        </div>
    </div>
</body>
</html>
