# Bank Management System

Welcome to the **Bank Management System** – a comprehensive web application designed to manage banking operations efficiently for both customers and administrators. This project integrates modern technologies to offer a seamless banking experience.

## Features

- **Account Management**: Manage customer accounts with features for creating, updating, and viewing account details.
- **Transaction History**: View and download transaction history.
- **Notification System**: Allow administrators to send important notifications to customers.
- **Secure Authentication**: Ensure secure access and data integrity.

## Tech Stack

- **Frontend**: HTML, CSS, JavaScript, JSP
- **Backend**: Java Servlets
- **Database**: MySQL
- **PDF Generation**: iText for generating PDF documents
- **Server**: Apache Tomcat

## Getting Started

### Prerequisites

- **Apache Tomcat** – Required for deploying the web application.
- **JDK** – Java Development Kit for compiling and running Java code.
- **MySQL** – Database system for data management.

### Installation Guide

1. **Clone the Repository**

    ```bash
    git clone https://github.com/BALAJI-I/your-repo-name.git
    ```

2. **Database Setup**

   - Create a MySQL database.
   - Import the provided SQL schema files to set up the required tables.
   - Update the database connection settings in your application configuration.

3. **Deploy the Application**

   - Ensure Tomcat and JDK are properly installed and configured.
   - Deploy the `.war` file or project directory to Tomcat.

4. **Launch the Application**

   - Open your web browser and go to `http://localhost:8080/your-app-context` to access the application.

## How to Use

- **View Transactions:** Go to `http://localhost:8080/your-app-context/transactionhistory.jsp` to view your transaction history.
- **Send Notifications:** Admins can send notifications via the admin panel.
- **Download PDFs:** Click the "Download Transaction History" button to generate and save a PDF of your transactions.

## Database Schema

### Transactions Table

- `transaction_id` (int, Primary Key, Auto Increment)
- `transaction_date` (date)
- `user_name` (varchar(100))
- `email` (varchar(100))
- `sent_or_received` (enum('Sent', 'Received'))
- `amount` (decimal(10,2))
- `balance` (decimal(10,2))
- `acc_no` (varchar(100))

### Customers Table

- `customer_id` (bigint, Primary Key, Auto Increment)
- `full_name` (varchar(100))
- `address` (varchar(255))
- `mobile_no` (varchar(15))
- `email` (varchar(100))
- `account_type` (varchar(50))
- `initial_balance` (decimal(15,2))
- `dob` (date)
- `id_proof` (longblob, Optional)
- `account_number` (varchar(50), Unique)
- `temp_password` (varchar(50))
- `balance` (decimal(15,2))
- `is_active` (tinyint(1))

## Contributing

Contributions are welcome! To contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push the branch (`git push origin feature/your-feature`).
5. Open a Pull Request with a clear description of your changes.

## Contact

- **Email:** [balajii1924@gmail.com](mailto:balajii1924@gmail.com)
- **LinkedIn:** [BALAJI I](https://www.linkedin.com/in/balaji-i/)
- **GitHub:** [BALAJI-I](https://github.com/BALAJI-I)



Thank you for exploring the Bank Management System! Feel free to reach out with any questions or suggestions.
