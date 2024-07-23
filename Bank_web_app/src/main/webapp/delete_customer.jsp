<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Customer Confirmation</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa; /* Set background color for the entire page */
            margin: 0;
            padding: 0;
        }
        .header {
            background-color:#003366;
            color: #003366;
            padding: 1rem;
            text-align: center;
            font-size: 1.5rem;
        }
        .container {
            padding: 2rem;
            max-width: 600px;
            margin: 2rem auto;
            background-color: white; /* Container background color */
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        form {
            margin-top: 2rem;
            text-align: center;
        }
        form button {
            padding: 0.75rem 1.5rem;
            background-color: #ff4d4d; /* Red color for delete */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 1rem;
        }
        form button:hover {
            background-color: #e60000; /* Darker shade of red on hover */
        }
        h3 {
            text-align: center;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Delete Customer</h1>
    </div>
    <div class="container">
        <form action="DeleteCustomerServlet" method="post">
            <h2>Account_Number:</h2><input type="text" name="accountId" value="<%= request.getParameter("accountNo") %>">
            <h3>Are you sure you want to delete this customer?</h3>
            <button type="submit">Delete</button>
            <a href="select_customer.jsp">Cancel</a> <!-- Link to cancel and go back -->
        </form>
    </div>
</body>
</html>
