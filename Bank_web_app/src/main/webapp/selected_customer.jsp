<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
            margin-top: 1.5rem;
        }
        table, th, td {
            border: 1px solid #e1e4e8;
        }
        th, td {
            padding: 0.75rem 1rem;
            text-align: left;
        }
        th {
            background-color: #003366;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f8f9fa;
        }
        .action {
            text-align: center;
        }
        .action a {
            padding: 0.5rem 1rem;
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        .action a:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Customer Details</h1>
    </div>
    <div class="container">
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
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM customers";
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

                            // Delete button as a link example
                            out.println("<td class='action'>");
                            out.println("<a href='delete_customer.jsp?accountNo=" + accountNo + "'>Delete</a>");
                            out.println("</td>");

                            out.println("</tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
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
        <div style="text-align: center; margin-top: 1rem;">
            <a href="admin_dashboard.jsp" style="padding: 0.5rem 1rem; background-color: #007bff; color: white; border-radius: 4px; text-decoration: none;">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
