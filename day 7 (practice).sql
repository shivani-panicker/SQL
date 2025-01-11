-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(255),
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    stock_quantity INT,
    added_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    sale_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2)
);

-- Create Sale_Items Table
CREATE TABLE Sale_Items (
    sale_item_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    total DECIMAL(10, 2)
);

-- Create Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    payment_method VARCHAR(50),
    amount DECIMAL(10, 2),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert Sample Data into Customers
INSERT INTO Customers (first_name, last_name, email, phone, address) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St, City, Country'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St, City, Country');

-- Insert Sample Data into Products
INSERT INTO Products (product_name, description, price, stock_quantity) VALUES
('Laptop', 'A high-performance laptop', 999.99, 50),
('Smartphone', 'Latest model smartphone', 499.99, 100),
('Headphones', 'Noise-cancelling headphones', 89.99, 200);

-- Insert Sample Data into Sales
INSERT INTO Sales (customer_id, total_amount) VALUES
(1, 1499.98),  -- John Doe
(2, 589.98);  -- Jane Smith

-- Insert Sample Data into Sale_Items
INSERT INTO Sale_Items (sale_id, product_id, quantity, price, total) VALUES
(1, 1, 1, 999.99, 999.99),  -- Sale 1: Laptop for John
(1, 2, 1, 499.99, 499.99),  -- Sale 1: Smartphone for John
(2, 2, 1, 499.99, 499.99),  -- Sale 2: Smartphone for Jane
(2, 3, 1, 89.99, 89.99);  -- Sale 2: Headphones for Jane

-- Insert Sample Data into Payments
INSERT INTO Payments (sale_id, payment_method, amount) VALUES
(1, 'Credit Card', 1499.98),  -- Payment for John Doe's Sale
(2, 'Debit Card', 589.98);  -- Payment for Jane Smith's Sale

-- Sample Queries

-- 1. Retrieve all customers
SELECT * FROM Customers;

-- 2. Retrieve all products
SELECT * FROM Products;

-- 3. Retrieve all sales with customer names
SELECT S.sale_id, C.first_name, C.last_name, S.sale_date, S.total_amount
FROM Sales S
JOIN Customers C ON S.customer_id = C.customer_id;

-- 4. Retrieve all items in a specific sale (e.g., Sale ID = 1)
SELECT SI.sale_item_id, P.product_name, SI.quantity, SI.price, SI.total
FROM Sale_Items SI
JOIN Products P ON SI.product_id = P.product_id
WHERE SI.sale_id = 1;

-- 5. Retrieve payments for a specific sale (e.g., Sale ID = 2)
SELECT P.payment_id, P.payment_method, P.amount, P.payment_date
FROM Payments P
WHERE P.sale_id = 2;

-- 6. Calculate the total sales amount for each product
SELECT P.product_name, SUM(SI.total) AS total_sales
FROM Sale_Items SI
JOIN Products P ON SI.product_id = P.product_id
GROUP BY P.product_name;

-- 7. Retrieve the total sales made by each customer
SELECT C.first_name, C.last_name, SUM(S.total_amount) AS total_sales
FROM Sales S
JOIN Customers C ON S.customer_id = C.customer_id
GROUP BY C.customer_id;

-- 8. Update stock quantity for a product after a sale (e.g., update stock for product_id = 1)
UPDATE Products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

-- 9. Delete a sale (e.g., Sale ID = 1)
DELETE FROM Sales WHERE sale_id = 1;

-- 10. Delete a product (e.g., product_id = 3)
DELETE FROM Products WHERE product_id = 3;
