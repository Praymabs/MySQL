-- LIMIT & ALIASING in SQL

-- LIMIT Clause: Used to restrict the number of rows in the output

-- Select the first 3 records from the employee demographics table
SELECT * 
FROM organization_management.employee_demographics
LIMIT 3
;

-- Select the 3 oldest employees by sorting age in descending order
SELECT * 
FROM organization_management.employee_demographics
ORDER BY age DESC
LIMIT 3
;

-- Select the 4th oldest employee (skipping the first 3 results)
SELECT * 
FROM organization_management.employee_demographics
ORDER BY age DESC
LIMIT 3, 1
;


-- ALIASING: Assigning custom names to columns for better readability

-- Select gender and calculate the average age per gender
-- Using ALIAS "avg_age" for the calculated average age column
-- Filter to only include groups where the average age is greater than 40
SELECT gender, AVG(age) AS avg_age 
FROM organization_management.employee_demographics
GROUP BY gender
HAVING avg_age > 40
;
