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
            color: #003366;
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
        form {
            margin-top: 2rem;
            text-align: center;
        }
        form button {
            padding: 0.75rem 1.5rem;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-left: 1rem;
        }
        form button:hover {
            background-color: #0056b3;
        }
        h1, h3 {
            text-align: center;
            color: #333;
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
                    <th>Action</th> <!-- Add new column for action buttons -->
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

                            // Modify button as a form submit example
                            out.println("<td>");
                            out.println("<form action='modify_customer.jsp' method='post'>");
                            out.println("<input type='hidden' name='accountNo' value='" + accountNo + "'>");
                            out.println("<button type='submit'>Modify</button>");
                            out.println("</form>");
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
        <!-- Back button -->
        <form action="admin_dashboard.jsp"> <!-- Replace "index.html" with your actual URL or use JavaScript to navigate -->
            <button type="submit">Back</button>
        </form>
    </div>
</body>
</html>
