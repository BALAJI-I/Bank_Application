package com.bankapp.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/AddCustomerServlet")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class AddCustomerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Forward to the JSP form for adding a new customer
        request.getRequestDispatcher("/admin_add_customer.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String address = request.getParameter("address");
        String mobileNo = request.getParameter("mobileNo");
        String email = request.getParameter("email");
        String accountType = request.getParameter("accountType");
        String initialBalance = request.getParameter("initialBalance");
        String dob = request.getParameter("dob");
        
        Part idProof = request.getPart("idProof");
        InputStream idProofStream = null;
        if (idProof != null) {
            idProofStream = idProof.getInputStream();
        }
        
        String accountNumber = generateAccountNumber();
        String tempPassword = generateRandomPassword(10);
        
        System.out.println("Generated Account Number: " + accountNumber);
        System.out.println("Generated Temporary Password: " + tempPassword);
        
        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/trustbank", "root", "1924");
            
            // Insert customer details into customers table
            String sql = "INSERT INTO customers (full_name, address, "
                    + "mobile_no, email, account_type, initial_balance, balance, dob, id_proof, account_number, temp_password) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, fullName);
            statement.setString(2, address);
            statement.setString(3, mobileNo);
            statement.setString(4, email);
            statement.setString(5, accountType);
            statement.setString(6, initialBalance); // Set initial_balance
            statement.setString(7, initialBalance); // Set balance to initial_balance
            statement.setString(8, dob);
            if (idProofStream != null) {
                statement.setBlob(9, idProofStream);
            } else {
                statement.setNull(9, java.sql.Types.BLOB);
            }
            statement.setString(10, accountNumber);
            statement.setString(11, tempPassword);

            // Execute the SQL statement
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                // Retrieve the customer ID for the newly inserted record
                long customerId = getCustomerId(connection, accountNumber);
                
                System.out.println("Customer ID: " + customerId);
                
                // Set attributes for success JSP
                request.setAttribute("customer_Id", customerId);
                request.setAttribute("account_number", accountNumber);
                request.setAttribute("temp_password", tempPassword);
                
                // Forward to success JSP
                request.getRequestDispatcher("custmer_add_successful.jsp").forward(request, response);
            } else {
                response.getWriter().print("Error: Customer not added.");
            }
            
            // Close statement and connection
            statement.close();
            connection.close();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            response.getWriter().print("Error: " + ex.getMessage());
        }
    }
    
    private long getCustomerId(Connection connection, String accountNumber) throws SQLException {
        // Query to retrieve customer ID based on account number
        String sql = "SELECT customer_id FROM customers WHERE account_number = ?";
        PreparedStatement statement = connection.prepareStatement(sql);
        statement.setString(1, accountNumber);
        ResultSet resultSet = statement.executeQuery();
        
        // Extract customer ID
        long customerId = -1;
        if (resultSet.next()) {
            customerId = resultSet.getLong("customer_id");
        }
        
        // Close result set and statement
        resultSet.close();
        statement.close();
        
        return customerId;
    }

    private String generateAccountNumber() {
        // Generate a unique account number (e.g., ACC followed by 8 digits)
        return  String.format("%08d", new Random().nextInt(100000000));
    }

    private String generateRandomPassword(int length) {
        // Generate a random alphanumeric password of given length
        String chars = "0123456789";
        StringBuilder password = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            password.append(chars.charAt(random.nextInt(chars.length())));
        }
        return password.toString();
    }
}
