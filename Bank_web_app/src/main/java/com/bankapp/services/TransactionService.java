package com.bankapp.services;

import com.bankapp.model.Transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TransactionService {

    public List<Transaction> getLast10Transactions(String userName) {
        List<Transaction> transactions = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();
            String viewTransactionsQuery = "SELECT * FROM transactions WHERE user_name = ? ORDER BY transaction_date DESC LIMIT 10";
            stmt = conn.prepareStatement(viewTransactionsQuery);
            stmt.setString(1, userName);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setTransactionId(rs.getInt("transaction_id"));
                transaction.setTransactionDate(rs.getDate("transaction_date"));
                transaction.setSentOrReceived(rs.getString("sent_or_received"));
                transaction.setAmount(rs.getDouble("amount"));
                transaction.setBalance(rs.getDouble("balance"));
                transaction.setAccNo(rs.getString("acc_no"));

                transactions.add(transaction);
            }

            System.out.println("Transactions fetched for user: " + userName);
            for (Transaction txn : transactions) {
                System.out.println(txn);
            }
        } catch (SQLException e) {
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
        return transactions;
    }
}
