<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Withdraw Amount</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
    <style>
    body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 400px;
    margin: 50px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    color: #333;
}

form {
    margin-top: 20px;
}

label {
    display: block;
    margin-bottom: 10px;
    color: #555;
}

input[type="number"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

button[type="submit"] {
    background-color: #4CAF50;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    width: 100%;
}

button[type="submit"]:hover {
    background-color: #45a049;
}

.error-message {
    color: #ff0000;
    margin-top: 10px;
}
    
    </style>
</head>
<body>
    <h2>Withdraw Amount</h2>
    <form action="WithdrawServlet" method="post">
        <label for="amount">Amount:</label>
        <input type="number" name="amount" id="amount" required>
        <br>
        <label for="withdraw-password">Password:</label>
        <input type="password" name="withdraw-password" id="withdraw-password" required>
        <br>
        <button type="submit">Withdraw</button>
    </form>
</body>
</html>
