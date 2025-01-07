-- Create 'students' table
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    dob DATE,
    email VARCHAR(100)
);

-- Create 'courses' table
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(255),
    course_code VARCHAR(20),
    credits INT
);

-- Create 'enrollments' table (without foreign keys)
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(2)
);

-- Insert students
INSERT INTO students (first_name, last_name, dob, email)
VALUES 
('John', 'Doe', '2001-02-15', 'john.doe@email.com'),
('Jane', 'Smith', '2000-07-22', 'jane.smith@email.com'),
('Alice', 'Johnson', '2002-09-30', 'alice.johnson@email.com');

-- Insert courses
INSERT INTO courses (course_name, course_code, credits)
VALUES 
('Introduction to Programming', 'CS101', 4),
('Data Structures and Algorithms', 'CS201', 3),
('Database Systems', 'CS301', 3);

-- Insert enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date, grade)
VALUES 
(1, 1, '2025-01-01', 'A'),
(1, 2, '2025-01-05', 'B'),
(2, 1, '2025-01-02', 'A'),
(3, 3, '2025-01-07', 'C');

-- Basic SQL Queries

-- a. SELECT Query: List All Students
SELECT * FROM students;

-- b. SELECT Query: List All Courses
SELECT * FROM courses;

-- c. SELECT Query: Find All Courses Enrolled by a Specific Student
SELECT 
    courses.course_name, 
    courses.course_code, 
    enrollments.enrollment_date, 
    enrollments.grade
FROM 
    enrollments
JOIN 
    courses ON enrollments.course_id = courses.course_id
WHERE 
    enrollments.student_id = 1;

-- d. SELECT Query: Find All Students Enrolled in a Specific Course
SELECT 
    students.first_name, 
    students.last_name, 
    students.email, 
    enrollments.enrollment_date, 
    enrollments.grade
FROM 
    enrollments
JOIN 
    students ON enrollments.student_id = students.student_id
WHERE 
    enrollments.course_id = 2;

-- e. Update Grade for a Student in a Course
UPDATE enrollments 
SET grade = 'A' 
WHERE student_id = 3 AND course_id = 3;

-- f. Delete an Enrollment Record
DELETE FROM enrollments 
WHERE enrollment_id = 4;

-- g. Count the Number of Students Enrolled in Each Course
SELECT 
    courses.course_name, 
    COUNT(enrollments.student_id) AS number_of_students
FROM 
    enrollments
JOIN 
    courses ON enrollments.course_id = courses.course_id
GROUP BY 
    courses.course_name;

-- h. Calculate Average Grade for a Specific Course
SELECT 
    course_name, 
    AVG(CASE grade
        WHEN 'A' THEN 4
        WHEN 'B' THEN 3
        WHEN 'C' THEN 2
        WHEN 'D' THEN 1
        ELSE 0
    END) AS average_grade
FROM 
    enrollments
JOIN 
    courses ON enrollments.course_id = courses.course_id
WHERE 
    courses.course_name = 'Introduction to Programming'
GROUP BY 
    courses.course_name;

-- i. List All Students Who Have Not Enrolled in Any Course
SELECT * 
FROM students 
WHERE student_id NOT IN (SELECT student_id FROM enrollments);
