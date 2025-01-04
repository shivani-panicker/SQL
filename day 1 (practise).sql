-- Insert departments
INSERT INTO departments (dept_id, dept_name, location)
VALUES
(1, 'HR', 'New York'),
(2, 'Engineering', 'San Francisco'),
(3, 'Marketing', 'Chicago');

-- Insert employees
INSERT INTO employees (emp_id, emp_name, salary, hire_date, dept_id)
VALUES
(101, 'Alice Smith', 55000, '2018-05-01', 1),
(102, 'Bob Johnson', 75000, '2019-06-15', 2),
(103, 'Charlie Brown', 60000, '2020-02-20', 2),
(104, 'David Williams', 50000, '2017-10-01', 3),
(105, 'Eve Davis', 85000, '2018-12-10', 3);

-- Insert projects
INSERT INTO projects (proj_id, proj_name, dept_id, budget)
VALUES
(1, 'Employee Wellness Program', 1, 100000),
(2, 'AI Development', 2, 500000),
(3, 'Brand Awareness Campaign', 3, 200000);

-- Insert employee project assignments
INSERT INTO employee_project_assignments (emp_id, proj_id, hours_per_week)
VALUES
(101, 1, 15),
(102, 2, 25),
(103, 2, 20),
(104, 3, 10),
(105, 3, 30);

SET SQL_SAFE_UPDATES = 0;
DELETE FROM projects;
SET SQL_SAFE_UPDATES = 1;


INSERT INTO projects (proj_id, proj_name, dept_id, budget)
VALUES
(1, 'Employee Wellness Program', 1, 100000),
(2, 'AI Development', 2, 500000),
(3, 'Brand Awareness Campaign', 3, 200000)
ON DUPLICATE KEY UPDATE
    proj_name = proj_name,
    dept_id = dept_id,
    budget = budget;




-- joins
-- Find the names of employees and their department names:
select employees.emp_name, departments.dept_name
from employees 
join departments
on employees.dept_id = departments.dept_id;

-- Find employees working on the 'AI Development' project:
select employees.emp_name
from employees
join projects 
on employees.dept_id=projects.dept_id
where projects.proj_name='AI Development';

-- Retrieve all employees along with their project names:
select employees.emp_name, projects.proj_name
from employees
join projects
on employees.dept_id = projects.dept_id;


-- subqueries
-- Find employees whose salary is above the average salary:
select emp_name, salary
from employees
where salary > (select avg(salary) from employees);

-- Find the department with the highest budge:
select departments.dept_name
from departments
join projects on departments.dept_id = projects.dept_id
where budget =( select max(budget) from projects);

-- Find employees working on projects with a budget greater than $200,000:
SELECT e.emp_name
FROM Employees e
JOIN Employee_Project_Assignments ea ON e.emp_id = ea.emp_id
JOIN Projects p ON ea.proj_id = p.proj_id
WHERE p.budget > 200000;

-- Window Functions
-- Find the salary of each employee and their rank based on salary within their department:
select employees.emp_name, salary, dept_id,
rank() over ( partition by dept_id order by salary desc) as salary_rank
from employees;


-- Calculate the cumulative salary for each employee in their department:
select employees.emp_name, salary, dept_id,
sum(salary) over ( partition by dept_id order by salary desc) as salary_rank
from employees;

-- Find the average salary of employees by department and rank departments:
select emp_name, dept_id , avg(salary) as avg_salary , rank() over ( partition by dept_id order by avg(salary) desc) as rank_of_salary
from employees
group by emp_name, dept_id;