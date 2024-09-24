# E-Commerce System Database

This project contains SQL code for creating and managing a simple e-commerce system database. The database consists of four main tables: `customers`, `orders`, `products`, and `order_items`. This structure enables the management of customers, their orders, the products available, and the items ordered in each transaction.

## Database Structure

The e-commerce system is designed with the following tables:

1. **customers**: Stores customer information, including their name, email, and address.
2. **orders**: Stores order details, such as the customer who placed the order, the order date, and the total amount.
3. **products**: Stores product information, including the name, price, and description.
4. **order_items**: Tracks which products were ordered in each order and the quantity of each item.

## SQL Queries

### 1. **Table Creation**
- `customers` table: Stores customer details with a unique email.
- `orders` table: Links each order to a customer and includes the total amount.
- `products` table: Stores information about products with a price and description.
- `order_items` table: Records which products are part of each order and their quantities.

### 2. **Sample Data Insertion**
- Inserting sample data for `customers`, `orders`, `products`, and `order_items` tables to demonstrate the functionality of the system.

### 3. **Data Queries**
- Query to select all customers, orders, and products.
- Query to retrieve the names of customers who placed an order within the last 30 days.
- Query to calculate the total amount spent by each customer.
- Query to select orders with a total amount greater than $150.
- Query to calculate the average total of all orders.

### 4. **Data Modification**
- Update the price of a product.
- Add a new column (`discount`) to the `products` table to track discount values.

### 5. **Advanced Queries**
- Retrieve the names of customers who ordered a specific product (e.g., 'Product A').
- Retrieve customer names and order dates for each order.
- Select the top 3 most expensive products.

## Setup Instructions

To run this SQL code locally, follow these steps:

1. **Install MySQL**:
   - Ensure you have MySQL installed on your system. You can download it from the [MySQL official website](https://dev.mysql.com/downloads/).

2. **Create a Database**:
   - Open a MySQL client (like MySQL Workbench or via terminal) and create a new database:
     ```sql
     CREATE DATABASE ecommerce;
     USE ecommerce;
     ```

3. **Run the SQL File**:
   - In your MySQL client, import the SQL file (`ecommerce_db.sql`) included in this repository:
     ```bash
     source path/to/ecommerce_db.sql;
     ```

4. **Check the Data**:
   - After running the SQL file, you can run queries to inspect the tables and data:
     ```sql
     SELECT * FROM customers;
     SELECT * FROM orders;
     SELECT * FROM products;
     SELECT * FROM order_items;
     ```

## File Structure

```bash
├── ecommerce_db.sql  # SQL file containing table creation, sample data, and queries
├── README.md         # Project documentation
