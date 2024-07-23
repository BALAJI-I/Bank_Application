<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Customer Details</title>
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
            max-width: 900px;
            margin: 2rem auto;
            background-color: white; /* Container background color */
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 0.75rem;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .action-links a {
            color: #007bff;
            text-decoration: none;
            margin-right: 10px;
        }
        .action-links a:hover {
            text-decoration: underline;
        }
        .message {
            margin-top: 1rem;
            padding: 1rem;
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Customer Details</h1>
    </div>
    <div class="container">
        <%
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.println("<div class='message'>" + message + "</div>");
            }
        %>
        <table>
            <thead>
                <tr>
                    <th>Account No</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Mobile No</th>
                    <th>Email</th>
                    <th>Account Type</th>
                    <th>Date of Birth</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        String DB_URL = "jdbc:mysql://localhost:3306/trustbank";
                        String DB_USERNAME = "root";
                        String DB_PASSWORD = "1924";

                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);

                        String sql = "SELECT * FROM customers";
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String accountNo = rs.getString("account_number");
                            String fullName = rs.getString("full_name");
                            String address = rs.getString("address");
                            String mobileNo = rs.getString("mobile_no");
                            String email = rs.getString("email");
                            String accountType = rs.getString("account_type");
                            String dob = rs.getString("dob");

                            out.println("<tr>");
                            out.println("<td>" + accountNo + "</td>");
                            out.println("<td>" + fullName + "</td>");
                            out.println("<td>" + address + "</td>");
                            out.println("<td>" + mobileNo + "</td>");
                            out.println("<td>" + email + "</td>");
                            out.println("<td>" + accountType + "</td>");
                            out.println("<td>" + dob + "</td>");
                            out.println("<td class='action-links'>");
                            out.println("<a href='delete_customer.jsp?accountNo=" + accountNo + "'>Delete</a>");
                            out.println("</td>");
                            out.println("</tr>");
                        }
                    } catch (ClassNotFoundException | SQLException e) {
                        e.printStackTrace();
                        out.println("<tr><td colspan='8'>Error occurred: " + e.getMessage() + "</td></tr>");
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException ex) {
                            ex.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
        <!-- Back button or link -->
        <a href="admin_dashboard.jsp">Back</a>
    </div>
</body>
</html>
