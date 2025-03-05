-- WHERE CLAUSE: Filtering data based on conditions

-- Select all records where the first name is "Prayma"
SELECT * 
FROM Organization_Management.employee_salary
WHERE first_name = "Prayma"
;

-- Select all employees who have a salary greater than 50,000
SELECT * 
FROM Organization_Management.employee_salary
WHERE salary > 50000
;

-- Select all employees who have a salary greater than or equal to 50,000
SELECT * 
FROM Organization_Management.employee_salary
WHERE salary >= 50000
;

-- Select all employees who have a salary less than 50,000
SELECT * 
FROM Organization_Management.employee_salary
WHERE salary < 50000
;

-- Select all employees who have a salary less than or equal to 50,000
SELECT * 
FROM Organization_Management.employee_salary
WHERE salary <= 50000
;

-- Select all male employees (gender is NOT "Female")
SELECT * 
FROM Organization_Management.employee_demographics
WHERE gender != "Female"
;

-- Select all female employees
SELECT * 
FROM Organization_Management.employee_demographics
WHERE gender = "Female"
;

-- Select all employees born after January 1, 1985
SELECT * 
FROM Organization_Management.employee_demographics
WHERE birth_date > "1985-01-01"
;

-- AND, OR, NOT -- Logical Operators

-- Select all male employees born after January 1, 1985
SELECT * 
FROM Organization_Management.employee_demographics
WHERE birth_date > "1985-01-01"
AND gender = "Male"
;

-- Select all employees who are either born after January 1, 1985 OR are male
SELECT * 
FROM Organization_Management.employee_demographics
WHERE birth_date > "1985-01-01"
OR gender = "Male"
;

-- Select all employees who are either born after January 1, 1985 OR are NOT male
SELECT * 
FROM Organization_Management.employee_demographics
WHERE birth_date > "1985-01-01"
OR NOT gender = "Male"
;

-- Select employees where the first name is "Prayma" AND age is 44, OR employees older than 55
SELECT * 
FROM Organization_Management.employee_demographics
WHERE (first_name = "Prayma" AND age = "44" ) OR age > 55
;

-- LIKE Statement: Pattern matching using % and _ wildcards

-- Select all employees whose first name is exactly "Prayma"
SELECT * 
FROM Organization_Management.employee_demographics
WHERE first_name LIKE "Prayma" 
;

-- Select all employees whose first name contains "an" anywhere in it
SELECT * 
FROM Organization_Management.employee_demographics
WHERE first_name LIKE "%an%" 
;

-- Select all employees whose first name starts with "a"
SELECT * 
FROM Organization_Management.employee_demographics
WHERE first_name LIKE "a%" 
;

-- Select all employees whose first name is exactly 3 characters long and starts with "a"
SELECT * 
FROM Organization_Management.employee_demographics
WHERE first_name LIKE "a__" 
;

-- Select all employees whose first name is exactly 4 characters long and starts with "a"
SELECT * 
FROM Organization_Management.employee_demographics
WHERE first_name LIKE "a___" 
;

-- Select all employees whose first name starts with "a" and is at least 3 characters long
SELECT * 
FROM Organization_Management.employee_demographics
WHERE first_name LIKE "a__%" 
;
