-- Creating Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(15),
    address VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10)
);

-- Creating Categories Table
CREATE TABLE Categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

-- Creating Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
);

-- Creating Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(50),
    salary DECIMAL(10, 2) NOT NULL
);

-- Creating Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    employee_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL
);

-- Creating OrderDetails Table
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Sample data for Categories
INSERT INTO Categories (category_name) VALUES
('Men\'s Clothing'),
('Women\'s Clothing'),
('Children\'s Clothing'),
('Accessories');

-- Sample data for Products
INSERT INTO Products (product_name, category_id, price, stock_quantity) VALUES
('T-Shirt', 1, 19.99, 100),
('Jeans', 1, 49.99, 50),
('Sweater', 2, 39.99, 70),
('Jacket', 2, 89.99, 30),
('Dress', 2, 59.99, 40),
('Shorts', 3, 29.99, 80),
('Hat', 4, 15.99, 150),
('Scarf', 4, 9.99, 200);

-- Sample data for Employees
INSERT INTO Employees (first_name, last_name, position, salary) VALUES
('John', 'Doe', 'Sales Associate', 2500.00),
('Jane', 'Smith', 'Manager', 3500.00),
('Emily', 'Davis', 'Cashier', 2000.00);

-- Sample data for Customers
INSERT INTO Customers (first_name, last_name, email, phone_number, address, city, state, zip_code) VALUES
('Alice', 'Johnson', 'alice.johnson@email.com', '555-1234', '123 Main St', 'New York', 'NY', '10001'),
('Bob', 'Williams', 'bob.williams@email.com', '555-5678', '456 Oak St', 'Los Angeles', 'CA', '90001'),
('Charlie', 'Brown', 'charlie.brown@email.com', '555-8765', '789 Pine St', 'Chicago', 'IL', '60601');

-- Sample data for Orders
INSERT INTO Orders (customer_id, employee_id, order_date, total_amount) VALUES
(1, 2, '2025-01-05', 129.99),
(2, 1, '2025-01-06', 89.97),
(3, 3, '2025-01-07', 159.98);

-- Sample data for OrderDetails
INSERT INTO OrderDetails (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 19.99),
(1, 2, 1, 49.99),
(2, 3, 2, 39.99),
(3, 5, 1, 59.99),
(3, 7, 2, 15.99);

-- Sample Queries:

-- 1. Get all customers
SELECT * FROM Customers;

-- 2. Get all products in a category
SELECT p.product_name, p.price, p.stock_quantity
FROM Products p
WHERE p.category_id = 2;

-- 3. Get order details for a specific order
SELECT o.order_id, p.product_name, od.quantity, od.price
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
WHERE od.order_id = 1;

-- 4. Get total sales per product
SELECT p.product_name, SUM(od.quantity) AS total_sold, SUM(od.quantity * od.price) AS total_sales
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name;

-- 5. Get total sales per employee
SELECT e.first_name, e.last_name, SUM(o.total_amount) AS total_sales
FROM Orders o
JOIN Employees e ON o.employee_id = e.employee_id
GROUP BY e.employee_id;
