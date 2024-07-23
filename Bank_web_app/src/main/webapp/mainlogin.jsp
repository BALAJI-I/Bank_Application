<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrustBank - Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }
        header {
            background-color: #003366;
            color: white;
            padding: 1rem;
            text-align: center;
        }
        nav {
            background-color: #004080;
            padding: 0.5rem;
        }
        nav ul {
            list-style-type: none;
            padding: 0;
            margin: 0;
            display: flex;
            justify-content: center;
        }
        nav ul li {
            margin: 0 1rem;
        }
        nav ul li a {
            color: white;
            text-decoration: none;
        }
        main {
            max-width: 800px;
            margin: 2rem auto;
            padding: 1rem;
            background-color: white;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .login-buttons {
            display: flex;
            justify-content: space-around;	
            margin-top: 2rem;
        }
        .login-button {
            padding: 0.5rem 1rem;
            background-color: #003366;
            color: white;
            text-decoration: none;
            border-radius: 3px;
        }
    </style>
</head>
<body>
    <header>
        <h1>TrustBank</h1>
    </header>
    <nav>
        <ul>
            <li><a href="mainlogin.jsp">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </nav>
    <main>
        <h2>Welcome to TrustBank</h2>
        <p>TrustBank is your trusted financial partner. We offer a wide range of banking services to meet all your financial needs.</p>
        <div class="login-buttons">
            <a href="customer_login.jsp" class="login-button">Customer Login</a>
            <a href="Admin_login.jsp" class="login-button">Admin Login</a>
        </div>
    </main>
</body>
</html>