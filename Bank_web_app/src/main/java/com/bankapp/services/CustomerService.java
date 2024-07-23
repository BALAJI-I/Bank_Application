package com.bankapp.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CustomerService {
    
    // Method to change password
    public boolean changePassword(String userName, String currentPassword, String newPassword) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = DatabaseConnection.getConnection();
            
            // Validate current password
            String validatePasswordQuery = "SELECT * FROM customers WHERE full_name = ? AND temp_password = ?";
            stmt = conn.prepareStatement(validatePasswordQuery);
            stmt.setString(1, userName);
            stmt.setString(2, currentPassword);
            
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                // Update password
                String updatePasswordQuery = "UPDATE customers SET temp_password = ? WHERE full_name = ?";
                stmt = conn.prepareStatement(updatePasswordQuery);
                stmt.setString(1, newPassword);
                stmt.setString(2, userName);
                
                int rowsAffected = stmt.executeUpdate();
                
                return rowsAffected > 0;
            } else {
                return false; // Current password validation failed
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
