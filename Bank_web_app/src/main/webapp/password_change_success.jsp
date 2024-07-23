<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Change Successful</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Ensure correct path to your CSS file -->
    <script type="text/javascript">
        window.onload = function() {
            // Display the overlay message
            document.getElementById('overlay').style.display = 'block';
        };

        // Function to close the overlay and redirect to dashboard
        function closeOverlay() {
            document.getElementById('overlay').style.display = 'none';
            window.location.href = "customer_dashboard.jsp"; // Redirect to dashboard
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            text-align: center;
            margin: 0; /* Reset default margin */
            padding: 0; /* Reset default padding */
        }
        .overlay-container {
            display: none; /* Initially hidden */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5); /* Semi-transparent black overlay */
            z-index: 1000; /* Ensure it's on top */
        }
        .overlay-content {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        h2 {
            color: #333;
        }
        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <!-- Overlay container -->
    <div class="overlay-container" id="overlay">
        <div class="overlay-content">
            <h2>Password Change Successful</h2>
            <button onclick="closeOverlay()">Close</button>
        </div>
    </div>
</body>
</html>
