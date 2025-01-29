-- Create Database
CREATE DATABASE SalesManagementSystem;
USE SalesManagementSystem;

-- Create Customers Table
CREATE TABLE Customers (
    CustomerID INT,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    ZipCode VARCHAR(10),
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Products Table
CREATE TABLE Products (
    ProductID INT,
    ProductName VARCHAR(255),
    Description TEXT,
    Price DECIMAL(10, 2),
    StockQuantity INT,
    Category VARCHAR(100),
    DateCreated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create SalesOrders Table
CREATE TABLE SalesOrders (
    OrderID INT,
    CustomerID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50)
);

-- Create SalesOrderDetails Table
CREATE TABLE SalesOrderDetails (
    OrderDetailID INT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    Total DECIMAL(10, 2)
);

-- Insert Sample Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, ZipCode)
VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '123 Main St', 'Springfield', 'IL', '62701'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St', 'Chicago', 'IL', '60601');

-- Insert Sample Products
INSERT INTO Products (ProductID, ProductName, Description, Price, StockQuantity, Category)
VALUES
(1, 'Laptop', '15-inch laptop with 16GB RAM', 1200.00, 100, 'Electronics'),
(2, 'Smartphone', '6-inch display, 64GB storage', 699.99, 50, 'Electronics'),
(3, 'Headphones', 'Noise-cancelling headphones', 150.00, 200, 'Accessories');

-- Insert Sample Sales Orders
INSERT INTO SalesOrders (OrderID, CustomerID, OrderDate, TotalAmount, Status)
VALUES
(1, 1, '2025-01-01', 1899.99, 'Shipped'),
(2, 2, '2025-01-15', 849.99, 'Processing');

-- Insert Sample Sales Order Details
INSERT INTO SalesOrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice, Total)
VALUES
(1, 1, 1, 1, 1200.00, 1200.00),  -- Order 1: 1 Laptop
(2, 1, 3, 1, 150.00, 150.00),  -- Order 1: 1 Headphones
(3, 2, 2, 1, 699.99, 699.99);  -- Order 2: 1 Smartphone
