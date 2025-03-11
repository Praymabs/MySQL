-- Retrieving all records from the employee demographics table
SELECT * 
FROM organization_management.employee_demographics;

-- Retrieving all records from the employee salary table
SELECT * 
FROM organization_management.employee_salary;

-- INNER JOIN: Combine employee demographics and salary data based on matching employee_id
SELECT * 
FROM organization_management.employee_demographics
INNER JOIN organization_management.employee_salary
    ON employee_demographics.employee_id = employee_salary.employee_id
;

-- Using Aliases for readability (dem = demographics, sal = salary)
SELECT * 
FROM organization_management.employee_demographics AS dem
INNER JOIN organization_management.employee_salary AS sal
    ON dem.employee_id = sal.employee_id
;

-- Selecting specific columns (employee_id, age, occupation) using INNER JOIN
SELECT dem.employee_id, dem.age, sal.occupation
FROM organization_management.employee_demographics AS dem
INNER JOIN organization_management.employee_salary AS sal
    ON dem.employee_id = sal.employee_id
;

-- LEFT JOIN: Retrieve all records from demographics, even if there is no matching record in salary
SELECT * 
FROM organization_management.employee_demographics AS dem
LEFT JOIN organization_management.employee_salary AS sal
    ON dem.employee_id = sal.employee_id
;

-- RIGHT JOIN: Retrieve all records from salary, even if there is no matching record in demographics
SELECT * 
FROM organization_management.employee_demographics AS dem
RIGHT JOIN organization_management.employee_salary AS sal
    ON dem.employee_id = sal.employee_id
;

-- SELF JOIN: Joining employee_salary table with itself on matching employee_id
SELECT * 
FROM organization_management.employee_salary emp1
JOIN organization_management.employee_salary emp2
    ON emp1.employee_id = emp2.employee_id
;

-- SELF JOIN: Finding employees where employee_id + 1 exists in another row
SELECT * 
FROM organization_management.employee_salary emp1
JOIN organization_management.employee_salary emp2
    ON emp1.employee_id + 1 = emp2.employee_id
;

-- SELF JOIN: Selecting and renaming columns for better readability
SELECT 
    emp1.employee_id AS emp_list,
    emp1.first_name AS first_name_list,
    emp1.last_name AS last_name_list,
    emp2.employee_id AS emp_name,
    emp2.first_name AS first_name_emp,
    emp2.last_name AS last_name_emp
FROM organization_management.employee_salary emp1
JOIN organization_management.employee_salary emp2
    ON emp1.employee_id + 1 = emp2.employee_id
;

-- MULTIPLE JOINS: Joining employee demographics, salary, and department tables
SELECT * 
FROM organization_management.employee_demographics AS dem
INNER JOIN organization_management.employee_salary AS sal
    ON dem.employee_id = sal.employee_id
INNER JOIN organization_management AS pd
    ON sal.dept_id = pd.department_id
;



