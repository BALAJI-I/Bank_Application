<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Download Transaction History</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa; /* Set background color for the entire page */
            margin: 0;
            padding: 0;
        }
        .header {
            background-color:#003366;
            color: #ffffff;
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
            text-align: center;
        }
        .download-link {
            padding: 1rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
            display: inline-block;
            margin-top: 1rem;
        }
        .download-link:hover {
            background-color: #0056b3;
        }
        .back-link {
            margin-top: 1rem;
            display: inline-block;
            padding: 0.5rem 1rem;
            background-color: #6c757d;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        .back-link:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Download Transaction History</h1>
    </div>
    <div class="container">
        <p>Click the button below to download your transaction history as a CSV file.</p>
        <a href="DownloadTransactionServlet" class="download-link">Download Transaction History</a>
        
        <!-- Back button -->
        <a href="transactionhistory.jsp" class="back-link">Back to Dashboard</a>
    </div>
</body>
</html>
