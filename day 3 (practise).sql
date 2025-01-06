-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Create Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2)
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Create OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT
);

-- Insert sample data into Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email) 
VALUES 
(1, 'John', 'Doe', 'john.doe@example.com'),
(2, 'Jane', 'Smith', 'jane.smith@example.com'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com');

-- Insert sample data into Products
INSERT INTO Products (ProductID, ProductName, Price) 
VALUES 
(1, 'Laptop', 1000.00),
(2, 'Smartphone', 500.00),
(3, 'Tablet', 300.00);

-- Insert sample data into Orders
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES 
(1, 1, '2025-01-01', 1500.00),
(2, 2, '2025-01-02', 500.00),
(3, 3, '2025-01-03', 900.00);

-- Insert sample data into OrderItems
INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 2, 1),
(4, 3, 3, 3);

-- 1. Join Operations

-- 1.1: Write a query that retrieves the first and last name of each customer along with their order ID, order date, and total amount from the Customers and Orders tables.
select * from Customers join Orders on Customers.CustomerID = Orders.CustomerID;

-- 1.2: Write a query that retrieves the details of all the items (product name, quantity, price, and total cost) in each order, joining Orders, OrderItems, and Products.
select * from Orders join OrderItems on Orders.OrderID = OrderItems.OrderID join Products on OrderItems.ProductID = Products.ProductID;

-- 2. Temporary Tables
-- used to check if data od total amount is correct.

-- 2.1: Create a temporary table that calculates the total cost for each order, summing up the price multiplied by quantity for all the products in each order. Query the temporary table to get the order totals.
create temporary table total_order_summary as
select Customers.CustomerID, Orders.OrderID, Orders.TotalAmount, sum(OrderItems.quantity * Products.Price) as Checking_total_price
from Customers
join Orders on Customers.CustomerID=Orders.CustomerID
join OrderItems on OrderItems.OrderID = Orders.OrderID
join Products on Products.ProductID = OrderItems.ProductID
group by Customers.CustomerID, Orders.OrderID, Orders.TotalAmount;

select * from total_order_summary;

-- temp tables can be used to create a table which can help in joining tables together which cannot usually be joined !!
-- For example, imagine you're calculating total sales for customers based on several joined tables. If the logic involves multiple calculations (e.g., summing, filtering, grouping), it's often clearer and more efficient to split the query into smaller steps: Create a temporary table to store the total sales for each customer. Use that temporary table to perform further calculations, such as ranking customers based on total sales.


-- 3. Common Table Expressions (CTEs)
-- 3.1: Calculate Total Amount Spent by Each Customer

WITH CustomerTotals AS (
    SELECT 
        c.CustomerID,
        c.FirstName,
        c.LastName,
        SUM(oi.Quantity * p.Price) AS TotalSpent
    FROM 
        Customers c
    JOIN 
        Orders o ON c.CustomerID = o.CustomerID
    JOIN 
        OrderItems oi ON o.OrderID = oi.OrderID
    JOIN 
        Products p ON oi.ProductID = p.ProductID
    GROUP BY 
        c.CustomerID
)
SELECT * FROM CustomerTotals;


-- Stored Procedures 
DELIMITER $$

CREATE PROCEDURE GetCustomerTotalSpent(IN customer_id INT)
BEGIN
    SELECT 
        c.FirstName, 
        c.LastName, 
        SUM(oi.Quantity * p.Price) AS TotalSpent
    FROM 
        Customers c
    JOIN 
        Orders o ON c.CustomerID = o.CustomerID
    JOIN 
        OrderItems oi ON o.OrderID = oi.OrderID
    JOIN 
        Products p ON oi.ProductID = p.ProductID
    WHERE 
        c.CustomerID = customer_id
    GROUP BY 
        c.CustomerID;
END $$

DELIMITER ;

-- To call the procedure for a specific customer:
CALL GetCustomerTotalSpent(1);
