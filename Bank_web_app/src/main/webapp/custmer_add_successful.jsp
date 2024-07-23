<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Added Successfully</title>
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
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .success-message {
            margin-top: 1rem;
            padding: 1rem;
            background-color: #e7f7e7;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        .details {
            margin-top: 1rem;
            padding: 1rem;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
         .back-button {
            display: inline-block;
            margin-top: 1rem;
            padding: 0.5rem 1rem;
            background-color: #003366;
            color: white;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Customer Added Successfully</h2>
    </div>
    <div class="container">
        <div class="success-message">
            <p>The customer has been added successfully!</p>
        </div>
        <div class="details">
            <p><strong>Customer ID:</strong> ${customer_Id}</p>
            <p><strong>Account Number:</strong> ${account_number}</p>
            <p><strong>Temporary Password:</strong> ${temp_password}</p>
        </div>
        <a class="back-button" href="admin_dashboard.jsp">Back</a>
    </div>
</body>
</html>
