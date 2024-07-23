<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Modify Customer Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color:#003366;
            color: white;
            padding: 1rem;
            text-align: center;
            font-size: 1.5rem;
        }
        .container {
            padding: 2rem;
            max-width: 900px;
            margin: 2rem auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        form {
            margin-top: 2rem;
            text-align: center;
        }
        form label {
            display: block;
            margin-bottom: 0.5rem;
        }
        form input[type="text"], form input[type="email"] {
            width: 100%;
            padding: 0.75rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        form button {
            padding: 0.75rem 1.5rem;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 1rem;
        }
        form button:hover {
            background-color: #0056b3;
        }
        h1, h3 {
            text-align: center;
            color: #333;
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
            color: #003366;
            text-decoration: none;
        }
        .logout a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Modify Customer Details</h1>
    </div>
    <div class="container">
        <form action="/Bank_web_app/ModifyCustomerServlet" method="post">
            <input type="hidden" name="accountId" value="<%= request.getParameter("accountNo") %>">
            <label for="fullName">Full Name</label>
            <input type="text" id="fullName" name="fullName" required>
            
            <label for="address">Address</label>
            <input type="text" id="address" name="address" required>
            
            <label for="mobileNo">Mobile No</label>
            <input type="text" id="mobileNo" name="mobileNo" required>
            
            <label for="email">Email</label>
            <input type="email" id="email" name="email" required>

            <label for="accountType">Account Type</label>
            <input type="text" id="accountType" name="accountType" required>
            
            <label for="dob">Date of Birth</label>
            <input type="text" id="dob" name="dob" placeholder="YYYY-MM-DD" required>
            
            <button type="submit">Modify Customer</button>
        </form>
    </div>
    <div class="logout">
        <a href="logout.jsp">Logout</a>
    </div>
    <div class="dashboard-options">
        <a href="admin_dashboard.jsp">Back to Dashboard</a>
    </div>
</body>
</html>
