-- Create the customers table
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255)
);

-- Create the orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Create the products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    description TEXT
);

-- Insert sample customers
INSERT INTO customers (name, email, address)
VALUES
('John Doe', 'john@example.com', '123 Main St'),
('Jane Smith', 'jane@example.com', '456 Oak St'),
('Alice Johnson', 'alice@example.com', '789 Pine St');

-- Insert sample orders
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES
(1, '2024-09-01', 120.00),
(2, '2024-09-15', 200.00),
(1, '2024-09-20', 80.00);

-- Insert sample products
INSERT INTO products (name, price, description)
VALUES
('Product A', 50.00, 'Description for Product A'),
('Product B', 30.00, 'Description for Product B'),
('Product C', 40.00, 'Description for Product C');

-- Select all customers, orders, and products
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;

-- Select customers who placed an order within the last 30 days
SELECT DISTINCT customers.name
FROM customers
JOIN orders ON customers.id = orders.customer_id
WHERE orders.order_date >= CURDATE() - INTERVAL 30 DAY;

-- Sum up total amount spent by each customer
SELECT customers.name, SUM(orders.total_amount) AS total_spent
FROM customers
JOIN orders ON customers.id = orders.customer_id
GROUP BY customers.name;

-- Update the price of 'Product C'
UPDATE products
SET price = 45.00
WHERE name = 'Product C';
SELECT * FROM products;

-- Add a discount column to products table
ALTER TABLE products
ADD COLUMN discount DECIMAL(5, 2) DEFAULT 0.00;
SELECT * FROM products;

-- Select top 3 most expensive products
SELECT name, price
FROM products
ORDER BY price DESC
LIMIT 3;

-- Create order_items table
CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Insert sample data into order_items
INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 2), -- John ordered 2 of Product A
(2, 2, 1), -- Jane ordered 1 of Product B
(3, 1, 1); -- John ordered 1 of Product A in a different order

-- Select all order_items
SELECT * FROM order_items;

-- Retrieve names of customers who ordered Product A
SELECT DISTINCT customers.name
FROM customers
JOIN orders ON customers.id = orders.customer_id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
WHERE products.name = 'Product A';

-- Retrieve customer name and order date for each order
SELECT customers.name, orders.order_date
FROM customers
JOIN orders ON customers.id = orders.customer_id;

-- Select orders with a total amount greater than 150.00
SELECT * FROM orders
WHERE total_amount > 150.00;

-- Calculate the average total of all orders
SELECT AVG(total_amount) AS avg_order_total
FROM orders;
