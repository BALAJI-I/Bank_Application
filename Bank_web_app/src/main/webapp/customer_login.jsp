<!DOCTYPE html>
<html>
<head>
    <title>Customer Login</title>
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
            max-width: 400px;
            margin: 2rem auto;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        form {
            margin-top: 2rem;
        }
        form label {
            display: block;
            margin-bottom: 0.5rem;
        }
        form input[type="text"], form input[type="password"] {
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
        }
        form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Customer Login</h1>
    </div>
    <div class="container">
        <form action="CustomerLoginServlet" method="post">
            <label for="accountNo">Account Number:</label>
            <input type="text" id="accountNo" name="accountNo" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
