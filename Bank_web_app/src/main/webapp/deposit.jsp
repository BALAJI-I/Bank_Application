<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deposit</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .deposit-form {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 2rem;
            width: 300px;
            text-align: center;
        }
        .deposit-form h2 {
            margin-bottom: 1rem;
            color: #003366;
        }
        .deposit-form label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
        }
        .deposit-form input[type="number"],
        .deposit-form input[type="password"] {
            width: calc(100% - 20px);
            padding: 0.5rem 10px;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .deposit-form button {
            background-color: #003366;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 0.5rem 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .deposit-form button:hover {
            background-color: #0056b3;
        }
        .message {
            margin-top: 1rem;
            color: green;
        }
    </style>
</head>
<body>
    <div class="deposit-form">
        <h2>Deposit Amount</h2>
        <form action="DepositServlet" method="post">
            <label for="amount">Amount:</label>
            <input type="number" name="amount" id="amount" required>
            <label for="deposit-password">Password:</label>
            <input type="password" name="deposit-password" id="deposit-password" required>
            <button type="submit">Deposit</button>
        </form>
    </div>
</body>
</html>
