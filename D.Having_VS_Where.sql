-- HAVING vs WHERE Clause: Understanding the difference

-- The WHERE clause is used to filter rows before aggregation (before GROUP BY).
-- The HAVING clause is used to filter aggregated results (after GROUP BY).

-- Select gender and the average age of employees, grouping by gender
-- Only include groups where the average age is greater than 40
SELECT gender, AVG(age)
FROM organization_management.employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;

-- Select occupation and the average salary of employees, filtering occupations containing "manager"
-- Only include groups where the average salary is greater than 75,000
SELECT occupation, AVG(salary)
FROM organization_management.employee_salary
WHERE occupation LIKE "%manager%"  -- Filters before grouping
GROUP BY occupation
HAVING AVG(salary) > 75000  -- Filters after grouping
;
