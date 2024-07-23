package com.bankapp.model;

import java.util.Date;

public class Transaction {
    private int transactionId;
    private Date transactionDate;
    private String sentOrReceived;
    private double amount;
    private double balance;
    private String accNo;

    // Getters and Setters
    public int getTransactionId() {
        return transactionId;
    }

    public void setTransactionId(int transactionId) {
        this.transactionId = transactionId;
    }

    public Date getTransactionDate() {
        return transactionDate;
    }

    public void setTransactionDate(Date transactionDate) {
        this.transactionDate = transactionDate;
    }

    public String getSentOrReceived() {
        return sentOrReceived;
    }

    public void setSentOrReceived(String sentOrReceived) {
        this.sentOrReceived = sentOrReceived;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
    }

    public String getAccNo() {
        return accNo;
    }

    public void setAccNo(String accNo) {
        this.accNo = accNo;
    }
}
