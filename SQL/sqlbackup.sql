CREATE DATABASE company_db;

USE company_db;

CREATE TABLE skills (
  skill_id INT AUTO_INCREMENT PRIMARY KEY,
  skill_name VARCHAR(255) NOT NULL,
  category VARCHAR(255)
);

SHOW DATABASES;

SHOW TABLES;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    salary DECIMAL(10,2),
    dept_id INT,
    gender VARCHAR(10)
);

RENAME TABLE staff TO employee;

INSERT INTO employee (first_name, last_name, email, hire_date, salary, dept_id, gender)
VALUES ('Alice', 'Green', 'alice.green@company.com', '2024-01-10', 62000.00, 4, 'Female');

CREATE TABLE project (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100),
    budget DECIMAL(10,2),
    dept_id INT
);

INSERT INTO project (project_name, budget, dept_id)
VALUES
  ('Mobile App', 60000.00, 2),
  ('Training Program', 25000.00, 1);
  
  CREATE TABLE department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO department (dept_name, location)
VALUES ('Sales', 'Boston');

INSERT INTO employee (first_name, email)
VALUES ('Tom', 'tom@company.com');

SELECT * FROM employee;

SELECT emp_id AS "Employee ID", first_name AS "Name", email AS "Email Address"
FROM employee;

SELECT * FROM employee
WHERE hire_date > '2023-01-01';

SELECT * FROM project
WHERE budget > 40000
ORDER BY budget DESC;

SELECT DISTINCT location FROM department;

ALTER TABLE employee
ADD COLUMN phone_number VARCHAR(15) AFTER email;

INSERT INTO employee (first_name, last_name, email, hire_date, salary, dept_id, gender)
VALUES ('Alice', 'Green', 'alice.green@company.com', '2024-01-10', 62000.00, 4, 'Female');
INSERT INTO employee (first_name, last_name, email, hire_date, salary, dept_id, gender)
VALUES ('John', 'Doe', 'John.green@company.com', '2024-01-10', 62000.00, 4, 'Female');

SELECT * FROM employee;

SET SQL_SAFE_UPDATES = 0;

UPDATE employee
SET salary = 65000.00
WHERE first_name = 'John' AND last_name = 'Doe';

UPDATE employee
SET gender = 'Other'
WHERE dept_id = 2;

ALTER TABLE employee
DROP COLUMN phone_number;

SELECT * FROM employee
WHERE salary BETWEEN 60000 AND 80000;

SELECT * FROM employee
WHERE first_name LIKE 'J%';

SELECT * FROM project
WHERE dept_id IN (1, 2);

SELECT * FROM employee
WHERE email IS NOT NULL;

SELECT * FROM department
WHERE location NOT IN ('New York', 'Chicago');

SELECT * FROM employee
WHERE YEAR(hire_date) = 2023;

SELECT SUM(salary) AS total_salary FROM employee;

SELECT AVG(budget) AS average_budget FROM project;

SELECT MAX(salary) AS highest_salary FROM employee;

SELECT COUNT(*) AS it_employee_count FROM employee WHERE dept_id = 2;

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

SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employee;

SELECT UPPER(dept_name) FROM department;

SELECT LEFT(email, 3) FROM employee;

SELECT ABS(-50000);

SELECT ROUND(AVG(salary), 2) FROM employee;

SELECT * FROM employee
ORDER BY hire_date DESC
LIMIT 3;

SELECT * FROM employee
ORDER BY emp_id
LIMIT 3 OFFSET 3;

SELECT first_name, salary,
IF(salary >= 70000, 'High', 'Low') AS salary_level
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

SELECT * FROM employee
ORDER BY LENGTH(first_name) DESC
LIMIT 1;

SELECT * FROM employee
WHERE hire_date BETWEEN DATE_SUB('2025-03-22', INTERVAL 90 DAY) AND '2025-03-22';

DELETE FROM employee
WHERE salary < 60000;

DROP TABLE project;
