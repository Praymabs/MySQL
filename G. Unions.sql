-- Using UNION to combine age and gender from employee_demographics with first_name and last_name from employee_salary.
-- This will result in an error because the column data types must match in both SELECT statements.
SELECT age, gender
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary;

-- Using UNION DISTINCT (default behavior of UNION) to merge unique first_name and last_name from both tables.
-- Removes duplicate entries from the final result.
SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

-- Using UNION ALL to combine first_name and last_name from both tables without removing duplicates.
-- This ensures all records from both tables are included.
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

-- Categorizing employees into three groups based on conditions:
-- 1. "OLD Man" (Male employees older than 40)
-- 2. "OLD Lady" (Female employees older than 40)
-- 3. "Highly Paid Employee" (Employees earning more than 70,000)
-- UNION ensures unique records by default.
SELECT first_name, last_name, 'OLD Man' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'OLD Lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000;

-- The same query as above, but with an ORDER BY clause to sort results by first_name and last_name.
SELECT first_name, last_name, 'OLD Man' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'OLD Lady' AS label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;
