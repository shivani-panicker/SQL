-- Create 'authors' table
CREATE TABLE authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birth_date DATE
);

-- Create 'books' table (without foreign keys)
CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author_id INT,
    publication_date DATE,
    genre VARCHAR(100),
    price DECIMAL(10, 2)
);

-- Create 'customers' table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Create 'orders' table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

-- Create 'order_details' table (without foreign keys)
CREATE TABLE order_details (
    order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10, 2)
);

-- Insert authors
INSERT INTO authors (first_name, last_name, birth_date)
VALUES 
('George', 'Orwell', '1903-06-25'),
('J.K.', 'Rowling', '1965-07-31'),
('J.R.R.', 'Tolkien', '1892-01-03');

-- Insert books
INSERT INTO books (title, author_id, publication_date, genre, price)
VALUES 
('1984', 1, '1949-06-08', 'Dystopian', 9.99),
('Harry Potter and the Sorcerer\'s Stone', 2, '1997-06-26', 'Fantasy', 14.99),
('The Hobbit', 3, '1937-09-21', 'Fantasy', 12.99);

-- Insert customers
INSERT INTO customers (first_name, last_name, email, phone)
VALUES 
('John', 'Doe', 'john.doe@email.com', '123-456-7890'),
('Jane', 'Smith', 'jane.smith@email.com', '987-654-3210'),
('Alice', 'Johnson', 'alice.johnson@email.com', '555-123-4567');

-- Insert orders
INSERT INTO orders (customer_id, order_date, total_amount)
VALUES 
(1, '2025-01-05', 24.98),
(2, '2025-01-06', 27.98),
(3, '2025-01-07', 12.99);

-- Insert order details
INSERT INTO order_details (order_id, book_id, quantity, price)
VALUES 
(1, 1, 1, 9.99), 
(1, 2, 1, 14.99), 
(2, 2, 1, 14.99), 
(2, 3, 1, 12.99), 
(3, 3, 1, 12.99);

-- Basic SQL Queries

-- a. SELECT Query: List All Books
SELECT * FROM books;

-- b. SELECT Query: Find All Orders for a Customer
SELECT * FROM orders WHERE customer_id = 1;

-- c. SELECT Query with JOIN: Get Order Details with Book Titles
SELECT 
    order_details.order_id, 
    order_details.quantity, 
    order_details.price, 
    books.title 
FROM 
    order_details
JOIN 
    books ON order_details.book_id = books.book_id;

-- d. Update Order Total Amount (For demonstration purposes)
UPDATE orders 
SET total_amount = 29.98 
WHERE order_id = 1;

-- e. Delete an Order
DELETE FROM orders WHERE order_id = 3;

-- f. Count the Number of Books for a Specific Author
SELECT COUNT(*) AS number_of_books 
FROM books 
WHERE author_id = 2;

-- g. Find All Books That Are in the Fantasy Genre
SELECT * 
FROM books 
WHERE genre = 'Fantasy';

-- h. Calculate the Total Price of All Orders
SELECT SUM(total_amount) AS total_sales FROM orders;

-- i. Select Books Published After a Specific Date
SELECT * 
FROM books 
WHERE publication_date > '1950-01-01';
