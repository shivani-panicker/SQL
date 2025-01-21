# SQL Practice

This repository contains a series of SQL exercises that cover key database operations. These practices focus on basic data manipulation (INSERT, DELETE, UPDATE), data retrieval (JOIN, subqueries), and advanced techniques like window functions to analyze and summarize data. This project is designed to help you master essential SQL concepts required for working with relational databases.

# Content
- DAY 1 : Employee Management System
- DAY 2 : Library Management System
- DAY 3 : Customer Management System
- DAY 4 : Student Management System
- DAY 5 : Restraunt Mangement System
- DAY 6 : Clothes Shop Management System
- DAY 7 : Sales Management
- DAY 8 : Laptop Management
- DAY 9 : Movie Rental System

## ADVANCED SQL CONCEPTS

### 1. **Common Table Expressions (CTEs)**  
A Common Table Expression (CTE) is typically used for queries that involve recursive data. It helps in simplifying complex queries and improves readability by avoiding repetitive code.

- **CTE vs Joins**:  
  Regular JOINs work well for non-recursive relationships but can struggle with hierarchical or recursive data (e.g., retrieving employees at all levels in a company hierarchy). CTEs are more suited for handling recursion efficiently.
  
- **When to Use CTEs**:  
  - **Simple Joins**: When querying one or two levels of relationships (e.g., fetching an employee and their direct manager), a simple JOIN is sufficient.  
  - **CTEs**: Use CTEs for recursive relationships or to simplify complex queries, such as retrieving all employees under a manager, including subordinates at multiple levels.

### 2. **Temporary Tables**  
Temporary tables allow you to store results temporarily and perform further operations on them. This is especially useful when you need to perform specific queries or aggregate functions on intermediate results, saving time and avoiding repetitive coding.

- **Benefits**:  
  - Store intermediate results for further querying.  
  - Perform complex operations on these results (e.g., aggregates, filters).

### 3. **Stored Procedures**  
Stored procedures are used to group SQL commands into a single, reusable unit of work. They are useful for automating repetitive tasks, handling conditions (e.g., IF statements), and managing transactions (e.g., error handling and ensuring data integrity).

- **Example**:  
  A stored procedure can be used to update the stock of a product:
  - Check if product 101 exists.
  - If it does, add 10 to its stock.
  - If not, display an error message: "Product not found."

- **Why Use Stored Procedures**:  
  - Avoid writing repetitive logic.
  - Easily reuse the same logic across multiple parts of your application.
  - Keep your SQL code organized, manageable, and maintainable.

---

Feel free to explore the examples and practice these SQL concepts to strengthen your database skills!


