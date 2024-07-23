<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer</title>
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
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-top: 1rem;
        }
        input, select {
            padding: 0.5rem;
            margin-top: 0.5rem;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
        button {
            margin-top: 1rem;
            padding: 0.5rem;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        button:hover {
            background-color: #004080;
        }
        .account-options {
            display: none;
            margin-top: 1rem;
            padding: 1rem;
            background-color: #f9f9f9;
            border: 1px solid #ccc;
            border-radius: 3px;
        }
    </style>
    <script>
        function showAccountOptions() {
            var accountType = document.getElementById("accountType").value;
            var savingOptions = document.getElementById("savingOptions");
            var currentOptions = document.getElementById("currentOptions");

            if (accountType === "Saving") {
                savingOptions.style.display = "block";
                currentOptions.style.display = "none";
            } else if (accountType === "Current") {
                savingOptions.style.display = "none";
                currentOptions.style.display = "block";
            } else {
                savingOptions.style.display = "none";
                currentOptions.style.display = "none";
            }
        }
    </script>
</head>
<body>
    <div class="header">
        <h2>Add Customer</h2>
    </div>
    <div class="container">
        <form action="AddCustomerServlet" method="post" enctype="multipart/form-data">

            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="mobileNo">Mobile No:</label>
            <input type="tel" id="mobileNo" name="mobileNo" required>

            <label for="email">Email ID:</label>
            <input type="email" id="email" name="email" required>

            <label for="accountType">Type of Account:</label>
            <select id="accountType" name="accountType" onchange="showAccountOptions()" required>
                <option value="">Select Account Type</option>
                <option value="Saving">Saving Account</option>
                <option value="Current">Current Account</option>
            </select>

            <label for="initialBalance">Initial Balance (min 1000):</label>
            <input type="number" id="initialBalance" name="initialBalance" min="1000" required>

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required>

            <label for="idProof">ID Proof:</label>
            <input type="file" id="idProof" name="idProof" required>

            <button type="submit">Add Customer</button>
        </form>
    </div>
</body>
</html>
