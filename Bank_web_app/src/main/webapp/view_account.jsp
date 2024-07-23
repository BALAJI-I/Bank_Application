<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa; /* Set background color for the entire page */
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #003366;
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
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            cursor: pointer;
        }
        .action a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Account Details</h1>
    </div>
    <div class="container">
        <table>
            <thead>
                <tr>
                    <th>Account Number</th>
                    <th>Full Name</th>
                    <th>Address</th>
                    <th>Mobile Number</th>
                    <th>Email</th>
                    <th>Account Type</th>
                    <th>Date of Birth</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Get DB connection parameters
                        String DB_URL = "jdbc:mysql://localhost:3306/trustbank";
                        String DB_USERNAME = "root";
                        String DB_PASSWORD = "1924";

                        // Retrieve HttpSession
                        HttpSession httpSession = request.getSession(false); // Check for existing session

                        // Debug: Print session status
                        if (httpSession == null) {
                            out.println("<tr><td colspan='7'>Session is null. Please log in again.</td></tr>");
                        } else {
                            out.println("<tr><td colspan='7'>Session is active.</td></tr>");
                        }

                        // Check if session exists and accountNo attribute is set
                        if (httpSession != null) {
                            Object accountNoObj = httpSession.getAttribute("accountNo");

                            // Debug: Check if accountNo attribute is null
                            if (accountNoObj == null) {
                                out.println("<tr><td colspan='7'>accountNo attribute is null.</td></tr>");
                            } else {
                                String accountNo = (String) accountNoObj;

                                // Debug: Print accountNo
                                out.println("<tr><td colspan='7'>accountNo: " + accountNo + "</td></tr>");

                                // Prepare SQL statement with parameter for account number
                                String sql = "SELECT account_number, full_name, address, mobile_no, email, account_type, dob FROM customers WHERE account_number = ?";

                                // Establish DB connection and execute query
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                conn = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
                                stmt = conn.prepareStatement(sql);
                                stmt.setString(1, accountNo);
                                rs = stmt.executeQuery();

                                // Display account details
                                if (rs.next()) {
                                    String accountNumber = rs.getString("account_number");
                                    String fullName = rs.getString("full_name");
                                    String address = rs.getString("address");
                                    String mobileNo = rs.getString("mobile_no");
                                    String email = rs.getString("email");
                                    String accountType = rs.getString("account_type");
                                    String dob = rs.getString("dob");

                                    out.println("<tr>");
                                    out.println("<td>" + accountNumber + "</td>");
                                    out.println("<td>" + fullName + "</td>");
                                    out.println("<td>" + address + "</td>");
                                    out.println("<td>" + mobileNo + "</td>");
                                    out.println("<td>" + email + "</td>");
                                    out.println("<td>" + accountType + "</td>");
                                    out.println("<td>" + dob + "</td>");
                                    out.println("</tr>");
                                } else {
                                    out.println("<tr><td colspan='7'>No account details found.</td></tr>");
                                }
                            }
                        } else {
                            out.println("<tr><td colspan='7'>No account details found. Please log in again.</td></tr>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<tr><td colspan='7'>Error fetching account details: " + e.getMessage() + "</td></tr>");
                    } finally {
                        // Close resources in finally block
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
            <a href="customer_dashboard.jsp" class="action">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
