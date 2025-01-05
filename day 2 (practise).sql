-- 1. Create Database
CREATE DATABASE LibraryManagement;
USE LibraryManagement;

-- 2. Create Tables

-- Table to store information about books
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    PublishedYear INT
);

-- Table to store information about members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255)
);

-- Table to track book transactions (loans)
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    DateIssued DATE,
    DateDue DATE,
    DateReturned DATE
);

-- 3. Insert Sample Data

-- Insert books into Books table
INSERT INTO Books (Title, Author, Genre, PublishedYear) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 1925),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960),
('1984', 'George Orwell', 'Dystopian', 1949),
('Pride and Prejudice', 'Jane Austen', 'Romance', 1813);

-- Insert members into Members table
INSERT INTO Members (FirstName, LastName, Email) VALUES
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com'),
('Emily', 'Davis', 'emily.davis@example.com');

-- 4. Track Transactions

-- Insert transactions (book loans) into Transactions table
INSERT INTO Transactions (BookID, MemberID, DateIssued, DateDue) VALUES
(1, 1, '2025-01-01', '2025-01-15'),  -- John Doe borrows The Great Gatsby
(2, 2, '2025-01-02', '2025-01-16'),  -- Jane Smith borrows To Kill a Mockingbird
(3, 3, '2025-01-03', '2025-01-17');  -- Emily Davis borrows 1984

-- 5. Query Data

-- a. Find all books currently loaned out
SELECT b.Title, b.Author, m.FirstName, m.LastName, t.DateIssued, t.DateDue
FROM Transactions t
JOIN Books b ON t.BookID = b.BookID
JOIN Members m ON t.MemberID = m.MemberID
WHERE t.DateReturned IS NULL;

-- b. Find members who have borrowed a particular book (e.g., '1984')
SELECT m.FirstName, m.LastName, m.Email
FROM Transactions t
JOIN Members m ON t.MemberID = m.MemberID
JOIN Books b ON t.BookID = b.BookID
WHERE b.Title = '1984';

-- c. Return a book (update transaction when book is returned)
UPDATE Transactions
SET DateReturned = '2025-01-07'
WHERE TransactionID = 3;

-- d. Find overdue books
SELECT b.Title, m.FirstName, m.LastName, t.DateDue
FROM Transactions t
JOIN Books b ON t.BookID = b.BookID
JOIN Members m ON t.MemberID = m.MemberID
WHERE t.DateDue < CURDATE() AND t.DateReturned IS NULL;
