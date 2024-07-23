<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Close Account</title>
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
            font-size: 1.5rem;
        }
        .container {
            padding: 2rem;
            max-width: 500px;
            margin: 2rem auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        form {
            text-align: center;
        }
        form button {
            padding: 0.75rem 1.5rem;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        form button:hover {
            background-color: #0056b3;
        }
        .message {
            text-align: center;
            margin-top: 1rem;
            color: red;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Close Account</h1>
    </div>
    <div class="container">
        <form action="CloseAccountServlet" method="post">
            <button type="submit">Close Account</button>
        </form>
        <div class="message">
            <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
        </div>
    </div>
</body>
</html>
