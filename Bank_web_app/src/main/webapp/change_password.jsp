<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Password Change</title>
    <link rel="stylesheet" type="text/css" href="styles.css"> <!-- Ensure correct path to your CSS file -->
    <script type="text/javascript">
        // Function to validate password change form
        function validatePasswordChangeForm() {
            var currentPassword = document.getElementById('currentPassword').value;
            var newPassword = document.getElementById('newPassword').value;

            // Check if current password and new password are the same
            if (currentPassword === newPassword) {
                alert("Current password and new password cannot be the same.");
                return false; // Prevent form submission
            }
            return true; // Allow form submission if passwords are different
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
        .password-change-container {
            width: 300px;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.3);
        }
        h2 {
            color: #333;
        }
        input[type="password"], button {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
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
    <div class="password-change-container">
        <h2>Change Password</h2>
        <form action="ChangePasswordServlet" method="post" onsubmit="return validatePasswordChangeForm()">
            <label for="currentPassword">Current Password:</label>
            <input type="password" id="currentPassword" name="currentPassword" required>

            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>

            <button type="submit">Change Password</button>
        </form>
    </div>
</body>
</html>
