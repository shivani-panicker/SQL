-- 1. Create Menu Items Table (Contains the food items on the menu)
CREATE TABLE MenuItems (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    category VARCHAR(100),  -- For example: Appetizer, Main Course, Dessert
    price DECIMAL(10, 2)
);

-- 2. Create Customers Table (Contains customer information)
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    phone_number VARCHAR(15),
    email VARCHAR(255)
);

-- 3. Create Orders Table (Contains order details for customers)
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- 4. Create Order Details Table (Captures specific items ordered by a customer)
CREATE TABLE OrderDetails (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    item_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);

-- 5. Create Staff Table (Contains staff working in the restaurant)
CREATE TABLE Staff (
    staff_id INT PRIMARY KEY,
    staff_name VARCHAR(255),
    role VARCHAR(100),  -- For example: Waiter, Chef
    salary DECIMAL(10, 2)
);

-- 6. Create Tables Table (Contains information about restaurant tables)
CREATE TABLE Tables (
    table_id INT PRIMARY KEY,
    table_number INT,  -- For example: Table 1, Table 2
    seating_capacity INT
);

-- Insert Menu Items
INSERT INTO MenuItems (item_id, item_name, category, price)
VALUES
(1, 'Spring Rolls', 'Appetizer', 5.99),
(2, 'Grilled Chicken', 'Main Course', 12.99),
(3, 'Chocolate Cake', 'Dessert', 4.50);

-- Insert Customers
INSERT INTO Customers (customer_id, name, phone_number, email)
VALUES
(1, 'John Doe', '123-456-7890', 'johndoe@email.com'),
(2, 'Jane Smith', '987-654-3210', 'janesmith@email.com');

-- Insert Orders
INSERT INTO Orders (order_id, customer_id, order_date, total_amount)
VALUES
(1, 1, '2025-01-09', 18.49),
(2, 2, '2025-01-09', 17.49);

-- Insert Order Details (Linking orders and menu items)
INSERT INTO OrderDetails (order_detail_id, order_id, item_id, quantity, price)
VALUES
(1, 1, 1, 2, 5.99),   -- 2 Spring Rolls for Order 1
(2, 1, 2, 1, 12.99),   -- 1 Grilled Chicken for Order 1
(3, 2, 3, 2, 4.50);    -- 2 Chocolate Cakes for Order 2

-- Insert Staff
INSERT INTO Staff (staff_id, staff_name, role, salary)
VALUES
(1, 'Michael Brown', 'Waiter', 2500.00),
(2, 'Sarah White', 'Chef', 3500.00);

-- Insert Tables
INSERT INTO Tables (table_id, table_number, seating_capacity)
VALUES
(1, 1, 4),
(2, 2, 2);

-- Sample Queries

-- 1. Get all Menu Items
SELECT * FROM MenuItems;

-- 2. Get All Orders
SELECT * FROM Orders;

-- 3. Get All Order Details
SELECT O.order_id, O.customer_id, M.item_name, OD.quantity, OD.price
FROM OrderDetails OD
JOIN Orders O ON OD.order_id = O.order_id
JOIN MenuItems M ON OD.item_id = M.item_id;

-- 4. Get Total Amount for Each Order
SELECT O.order_id, O.total_amount
FROM Orders O;

-- 5. Get Orders for a Specific Customer
SELECT O.order_id, O.order_date, O.total_amount
FROM Orders O
WHERE O.customer_id = 1;  -- Change customer_id to fetch data for other customers

-- 6. Get Staff by Role
SELECT * FROM Staff
WHERE role = 'Waiter';  -- Change to 'Chef' or any other role as needed

-- 7. Get Orders Made on a Specific Date
SELECT O.order_id, O.customer_id, O.order_date, O.total_amount
FROM Orders O
WHERE O.order_date = '2025-01-09';  -- Change the date as needed

-- 8. Get All Tables and Their Capacity
SELECT * FROM Tables;

-- 9. Get Menu Item with Highest Price
SELECT item_name, price
FROM MenuItems
ORDER BY price DESC
LIMIT 1;

-- 10. Get Orders for a Specific Menu Item
SELECT O.order_id, O.customer_id, M.item_name, OD.quantity, OD.price
FROM OrderDetails OD
JOIN Orders O ON OD.order_id = O.order_id
JOIN MenuItems M ON OD.item_id = M.item_id
WHERE M.item_name = 'Grilled Chicken';  -- Change the item name as needed
