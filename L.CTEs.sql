-- Common Table Expression (CTE) to calculate salary statistics per gender
WITH CTE_Example AS (
    SELECT 
        gender, 
        AVG(salary) AS avg_salary,  -- Calculate the average salary per gender
        MAX(salary) AS max_salary,  -- Get the maximum salary per gender
        MIN(salary) AS min_salary,  -- Get the minimum salary per gender
        COUNT(salary) AS count_salary  -- Count the number of salaries per gender
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT *
FROM CTE_Example;  -- Retrieve the aggregated salary statistics per gender


-- CTE to calculate the average of average salaries per gender
WITH CTE_Example AS (
    SELECT 
        gender, 
        AVG(salary) AS avg_sal,  -- Average salary per gender
        MAX(salary) AS max_sal,  -- Maximum salary per gender
        MIN(salary) AS min_sal,  -- Minimum salary per gender
        COUNT(salary) AS count_sal  -- Count of salaries per gender
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
)
SELECT AVG(avg_sal)  -- Calculate the overall average of the average salaries
FROM CTE_Example;


-- Alternative approach using a subquery instead of a CTE
SELECT AVG(avg_sal)
FROM (
    SELECT 
        gender, 
        AVG(salary) AS avg_sal,  -- Calculate average salary per gender
        MAX(salary) AS max_sal,  -- Maximum salary per gender
        MIN(salary) AS min_sal,  -- Minimum salary per gender
        COUNT(salary) AS count_sal  -- Count of salaries per gender
    FROM employee_demographics dem
    JOIN employee_salary sal
        ON dem.employee_id = sal.employee_id
    GROUP BY gender
) example_subquery;  -- Compute the overall average of average salaries


-- Using multiple CTEs to filter employees by birth date and salary
WITH CTE_Example AS (
    SELECT 
        employee_id, 
        gender, 
        birth_date
    FROM employee_demographics 
    WHERE birth_date > '1985-01-01'  -- Select employees born after January 1, 1985
),
CTE_Example2 AS (
    SELECT 
        employee_id, 
        salary
    FROM employee_salary
    WHERE salary > 50000  -- Select employees with a salary greater than 50,000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
    ON CTE_Example.employee_id = CTE_Example2.employee_id;  -- Join the two CTEs on employee_id to find eligible employees

