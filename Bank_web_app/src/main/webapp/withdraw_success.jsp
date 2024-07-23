<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Withdrawal Success</title>
    <style>
        /* CSS styles for the success message container */
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .success-container {
            width: 50%; /* Adjust width as needed */
            padding: 20px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .back-button {
            margin-top: 20px; /* Adjust spacing */
        }
    </style>
</head>
<body>
    <div class="success-container">
        <h2>Withdrawal Successful</h2>
        <p>Your new balance is: <span id="currentBalance"><%= request.getAttribute("newBalance") != null ? request.getAttribute("newBalance") : "N/A" %></span></p>
        
        <!-- Back button -->
        <button class="back-button" onclick="goBack()">Go Back</button>

        <!-- You can add additional content here if needed -->
    </div>

    <script>
        // Function to navigate back to customer dashboard
        function goBack() {
            window.location.href = "customer_dashboard.jsp"; // Replace with your actual customer dashboard page
        }
    </script>
</body>
</html>