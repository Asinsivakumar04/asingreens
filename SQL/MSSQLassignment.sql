CREATE DATABASE company_db;
GO

USE company_db;
GO

CREATE TABLE skills (
  skill_id INT IDENTITY(1,1) PRIMARY KEY,
  skill_name VARCHAR(255) NOT NULL,
  category VARCHAR(255)
);

SELECT name FROM sys.databases;

SELECT * FROM INFORMATION_SCHEMA.TABLES;

CREATE TABLE employee (
    emp_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2),
    dept_id INT,
    gender VARCHAR(10)
);

EXEC sp_rename 'employee', 'staff';
EXEC sp_rename 'staff', 'employee';

INSERT INTO employee (first_name, last_name, email, hire_date, salary, dept_id, gender)
VALUES ('Alice', 'Green', 'alice.green@company.com', '2024-01-10', 62000.00, 4, 'Female');

CREATE TABLE project (
    project_id INT IDENTITY(1,1) PRIMARY KEY,
    project_name VARCHAR(100),
    budget DECIMAL(10,2),
    dept_id INT
);

INSERT INTO project (project_name, budget, dept_id)
VALUES
('Mobile App', 60000.00, 2),
('Training Program', 25000.00, 1);

CREATE TABLE department (
    dept_id INT IDENTITY(1,1) PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO department (dept_name, location)
VALUES ('Sales', 'Boston');

INSERT INTO employee (first_name, email)
VALUES ('Tom', 'tom@company.com');

SELECT * FROM employee;

SELECT emp_id AS [Employee ID], first_name AS [Name], email AS [Email Address]
FROM employee;

SELECT * FROM employee
WHERE hire_date > '2023-01-01';

SELECT * FROM project
WHERE budget > 40000
ORDER BY budget DESC;

SELECT DISTINCT location FROM department;

ALTER TABLE employee
ADD phone_number VARCHAR(15);

INSERT INTO employee (first_name, last_name, email, hire_date, salary, dept_id, gender)
VALUES ('Alice', 'Green', 'alice.green@company.com', '2024-01-10', 62000.00, 4, 'Female');

INSERT INTO employee (first_name, last_name, email, hire_date, salary, dept_id, gender)
VALUES ('John', 'Doe', 'John.green@company.com', '2024-01-10', 62000.00, 4, 'Female');

SELECT * FROM employee;

UPDATE employee
SET salary = 65000.00
WHERE first_name = 'John' AND last_name = 'Doe';

UPDATE employee
SET gender = 'Other'
WHERE dept_id = 2;

EXEC sp_help employee;

ALTER TABLE employee
DROP COLUMN phone_number;

SELECT * FROM employee
WHERE salary BETWEEN 60000 AND 80000;

SELECT * FROM employee
WHERE first_name LIKE 'J%';

SELECT * FROM project
WHERE dept_id IN (1,2);

SELECT * FROM employee
WHERE email IS NOT NULL;

SELECT * FROM department
WHERE location NOT IN ('New York','Chicago');

SELECT * FROM employee
WHERE YEAR(hire_date) = 2023;

SELECT SUM(salary) AS total_salary FROM employee;

SELECT AVG(budget) AS average_budget FROM project;

SELECT MAX(salary) AS highest_salary FROM employee;

SELECT COUNT(*) AS it_employee_count
FROM employee
WHERE dept_id = 2;

SELECT MIN(budget) AS min_budget FROM project;

SELECT e.*, d.dept_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id;

SELECT d.dept_name, COUNT(e.emp_id) AS employee_count
FROM department d
LEFT JOIN employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

SELECT p.*, d.dept_name
FROM project p
JOIN department d ON p.dept_id = d.dept_id;

SELECT e.*
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE d.location = 'San Francisco';

SELECT d.*
FROM department d
LEFT JOIN project p ON d.dept_id = p.dept_id
WHERE p.dept_id IS NULL;

SELECT CONCAT(first_name,' ',last_name) AS full_name
FROM employee;

SELECT UPPER(dept_name) FROM department;

SELECT LEFT(email,3) FROM employee;

SELECT ABS(-50000);

SELECT ROUND(AVG(salary),2) FROM employee;

SELECT TOP 3 * 
FROM employee
ORDER BY hire_date DESC;

SELECT *
FROM employee
ORDER BY emp_id
OFFSET 3 ROWS FETCH NEXT 3 ROWS ONLY;

SELECT first_name, salary,
CASE
WHEN salary >= 70000 THEN 'High'
ELSE 'Low'
END AS salary_level
FROM employee;

SELECT project_name, budget,
CASE
WHEN budget >= 60000 THEN 'Large'
WHEN budget >= 40000 THEN 'Medium'
ELSE 'Small'
END AS budget_category
FROM project;

SELECT dept_id, SUM(budget) AS total_budget
FROM project
GROUP BY dept_id;

SELECT TOP 1 *
FROM employee
ORDER BY LEN(first_name) DESC;

SELECT *
FROM employee
WHERE hire_date BETWEEN DATEADD(DAY,-90,'2025-03-22') AND '2025-03-22';

DELETE FROM employee
WHERE salary < 60000;

SELECT name FROM sys.databases;