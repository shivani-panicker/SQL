# SQL-
All SQL Practise

SQL Database Operations:
These practices cover basic data manipulation (INSERT, DELETE, UPDATE), data retrieval (JOIN, subqueries), and advanced SQL techniques such as window functions for analyzing and summarizing data. This project helps in mastering key SQL concepts essential for working with relational databases.


MAIN POINTS 
Cte ( common table expression is usually used for queries containing recursive data )
extra: saves time avoids repetative coding.
-  CTE VS JOINS : a regular JOIN would not handle recursion well. It would only show a single level of relationships. A CTE allows you to easily handle recursion and find employees at all levels in the hierarchy. 
 - WHICH TO USE WHEN
 - Simple Joins: If you're just retrieving data from one or two levels of relationships (e.g., an employee and their direct manager), a simple join works perfectly fine. 
   - CTE: Use CTE when you have a recursive relationship or you need to simplify complex queries. For example, if you need to find all employees under a manager, including all their subordinates at different levels, a CTE is much easier to manage.
  
Temp Tables (Store results in temporaty tables)
extra: can carry out specific quereies eg aggregate functions on the tamp tables which saves time avoids repetative coding.

Stored Procedure( When you need to run a set of SQL commands repeatedly, and you want to organize logic like checking conditions (if something is true, do this; if not, do that), or handle errors and transactions (to ensure everything happens correctly).)
- Example: You want to update the stock of a product, but only if it exists. If it doesn’t, you show an error message. A stored procedure can take care of that logic for you.
-- This will:

--- Check if product 101 exists.
--- If it does, it will add 10 to its stock.
--- If it doesn’t exist, it will print "Product not found".
--- Why is This Helpful?
--- You don’t have to write the UPDATE logic each time.
--- You can use this procedure in many places in your application without repeating the same code.
--- It keeps your SQL logic organized and easy to manage.
