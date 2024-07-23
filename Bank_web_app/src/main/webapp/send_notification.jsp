<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send Notification</title>
</head>
<body>
    <h1>Send Notification</h1>
    
    <%-- Display success or error messages --%>

    
    <form action="SendNotificationServlet" method="post">
        <label for="message">Message:</label><br>
        <textarea id="message" name="message" rows="4" cols="50" required></textarea><br><br>
        
        <label for="type">Type:</label><br>
        <input type="text" id="type" name="type" required><br><br>
        
        <label for="recipientId">Recipient Account ID:</label><br>
        <input type="text" id="recipientId" name="recipientId" required><br><br>
        
        <input type="submit" value="Send Notification">
    </form>
    
    <br>
    <a href="admin_dashboard.jsp">Back to Dashboard</a>
</body>
</html>
