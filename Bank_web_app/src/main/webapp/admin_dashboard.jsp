	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #003366;
            color: white;
            padding: 1rem;
            text-align: center;
        }
        .container {
            padding: 2rem;
        }
        .dashboard-options {
            display: flex;
            flex-direction: column;
            align-items: center;
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
        .logout {
            margin-top: 2rem;
            text-align: center;
        }
        .logout a {
        	 background-color: #003366;
            color: white;
            padding: 1rem;
            margin: 0.5rem;
            text-decoration: none;
            border-radius: 5px;
            width: 200px;
            text-align: center;
        }
        .logout{
        display: flex;
            flex-direction: column;
            align-items: center;
        }
        .logout a:hover {
            background-color: #004080;
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Admin Dashboard</h2>
    </div>
    <div class="container">
        <h3>Welcome, <%= session.getAttribute("admin_username") %></h3>
        <div class="dashboard-options">
            <a href="admin_add_customer.jsp">Add Customer</a>
            <a href="view_customers.jsp">View Customers</a>
            <a href="selected_customer.jsp">Delete Customer</a>
        </div>
        <div class="logout">
            <a href="mainlogin.jsp">Logout</a>
        </div>
    </div>
</body>
</html>
