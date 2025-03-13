-- Categorizing employees based on age.
-- Employees aged 30 or younger are labeled as "young".
SELECT first_name,
       last_name,
       age,
       CASE
           WHEN age <= 30 THEN "young"
       END AS age_category
FROM employee_demographics;

-- Extending age categorization:
-- Employees aged 30 or younger: "young"
-- Employees between 31 and 50: "old"
-- Employees aged 50 or more: "on death's door"
SELECT first_name,
       last_name,
       age,
       CASE
           WHEN age <= 30 THEN "young"
           WHEN age BETWEEN 31 AND 50 THEN 'old'
           WHEN age >= 50 THEN "on death's door"
       END AS age_bracket
FROM employee_demographics;

-- Pay increase for employees earning less than 50,000:
-- Salary is increased by 5%.
SELECT first_name, last_name, salary,
       CASE 
           WHEN salary < 50000 THEN salary + (salary * 0.05)
       END AS New_salary
FROM employee_salary;

-- Salary adjustments based on current salary:
-- Salaries under 50,000 increase by 5%.
-- Salaries above 50,000 increase by 7%.
-- Salaries equal to 50,000 increase by 6%.
SELECT first_name, last_name, salary,
       CASE 
           WHEN salary < 50000 THEN salary * 1.05
           WHEN salary > 50000 THEN salary * 1.07
           WHEN salary = 50000 THEN salary * 1.06
       END AS New_salary
FROM employee_salary;

-- Retrieving all records from the employee_salary table.
SELECT * FROM employee_salary;

-- Retrieving all records from the organization_departments table.
SELECT * FROM organization_departments;

-- Applying both salary increase and bonus calculation:
-- Salary increases:
--   - Salaries under 50,000 increase by 5%.
--   - Salaries over 50,000 increase by 7%.
-- Bonus allocation:
--   - Employees in department ID 6 receive a 10% bonus.
SELECT first_name, last_name, salary,
       CASE 
           WHEN salary < 50000 THEN salary * 1.05
           WHEN salary > 50000 THEN salary * 1.07
       END AS New_salary,
       CASE
           WHEN dept_id = 6 THEN salary * 0.10  
       END AS Bonus
FROM employee_salary;
