-- Creating the Laptop table
CREATE TABLE Laptops (
    laptop_id INT PRIMARY KEY,
    brand VARCHAR(50),
    model VARCHAR(50),
    processor VARCHAR(50),
    ram_size INT,
    storage_size INT,
    price DECIMAL(10, 2),
    purchase_date DATE
);

-- Inserting some sample data into the Laptops table
INSERT INTO Laptops (laptop_id, brand, model, processor, ram_size, storage_size, price, purchase_date) VALUES
(1, 'Dell', 'XPS 13', 'Intel i7', 16, 512, 1200.50, '2024-05-01'),
(2, 'HP', 'Spectre x360', 'Intel i5', 8, 256, 950.00, '2024-07-10'),
(3, 'Apple', 'MacBook Pro', 'M1', 8, 512, 1500.00, '2024-08-15'),
(4, 'Lenovo', 'ThinkPad X1', 'Intel i7', 16, 1000, 1800.00, '2024-09-20'),
(5, 'Asus', 'ZenBook', 'Intel i5', 8, 512, 1100.00, '2024-10-01');

-- Query 1: Retrieve all laptops
SELECT * FROM Laptops;

-- Query 2: Retrieve laptops with 16GB of RAM or more
SELECT laptop_id, brand, model, ram_size, price
FROM Laptops
WHERE ram_size >= 16;

-- Query 3: Retrieve laptops by price range (e.g., between $1000 and $1500)
SELECT laptop_id, brand, model, price
FROM Laptops
WHERE price BETWEEN 1000 AND 1500;

-- Query 4: Retrieve laptops with "Intel i7" processor
SELECT laptop_id, brand, model, processor
FROM Laptops
WHERE processor = 'Intel i7';

-- Query 5: Find the most expensive laptop
SELECT laptop_id, brand, model, price
FROM Laptops
ORDER BY price DESC
LIMIT 1;

-- Query 6: Count how many laptops are available in the system
SELECT COUNT(*) AS total_laptops
FROM Laptops;

-- Query 7: Retrieve laptops purchased after '2024-07-01'
SELECT laptop_id, brand, model, purchase_date
FROM Laptops
WHERE purchase_date > '2024-07-01';
