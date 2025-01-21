-- Create tables for Movies, Customers, and Rentals

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50),
    release_year INT,
    rental_price DECIMAL(5, 2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE rentals (
    rental_id INT PRIMARY KEY,
    customer_id INT,
    movie_id INT,
    rental_date DATE,
    return_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

-- Insert sample data into movies
INSERT INTO movies (movie_id, title, genre, release_year, rental_price)
VALUES 
(1, 'The Shawshank Redemption', 'Drama', 1994, 3.99),
(2, 'The Dark Knight', 'Action', 2008, 4.99),
(3, 'Inception', 'Sci-Fi', 2010, 3.49);

-- Insert sample data into customers
INSERT INTO customers (customer_id, first_name, last_name, email, phone)
VALUES
(1, 'Alice', 'Johnson', 'alice@example.com', '123-456-7890'),
(2, 'Bob', 'Smith', 'bob@example.com', '987-654-3210');

-- Insert sample data into rentals
INSERT INTO rentals (rental_id, customer_id, movie_id, rental_date, return_date)
VALUES
(1, 1, 2, '2025-01-15', '2025-01-20'),
(2, 2, 3, '2025-01-18', '2025-01-25');

SELECT m.title, r.rental_date, r.return_date
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
WHERE r.customer_id = 1;

SELECT genre, COUNT(*) AS rental_count
FROM rentals r
JOIN movies m ON r.movie_id = m.movie_id
GROUP BY genre
ORDER BY rental_count DESC
LIMIT 1;
