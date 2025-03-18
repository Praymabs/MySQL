-- Selecting all employee details whose department ID is 1
-- Uses a subquery to fetch employee IDs from the employee_salary table
SELECT *
FROM employee_demographics
WHERE employee_id IN 
      (SELECT employee_id
       FROM employee_salary
       WHERE dept_id = 1);

-- Calculating the average salary grouped by first name and salary
SELECT first_name, salary, AVG(salary)
FROM employee_salary
GROUP BY first_name, salary;

-- Fetching first name, salary, and the overall average salary (subquery)
SELECT first_name, salary,
       (SELECT AVG(salary) FROM employee_salary) AS overall_avg_salary
FROM employee_salary;

-- Aggregating employee age statistics grouped by gender
SELECT gender, 
       AVG(age) AS avg_age, 
       MAX(age) AS max_age, 
       MIN(age) AS min_age, 
       COUNT(age) AS total_count
FROM employee_demographics
GROUP BY gender;

-- Incorrect use of 'max(age)' as a string; corrected version follows.
-- Aggregating maximum age from a subquery result for each gender
SELECT gender, AVG(max_age) 
FROM
     (SELECT gender, 
             AVG(age) AS avg_age, 
             MAX(age) AS max_age, 
             MIN(age) AS min_age, 
             COUNT(age) AS count_age
      FROM employee_demographics
      GROUP BY gender) AS agg_table
GROUP BY gender;

-- Calculating the overall average of max(age) from the aggregated table
SELECT AVG(max_age)
FROM
     (SELECT gender, 
             AVG(age) AS avg_age, 
             MAX(age) AS max_age, 
             MIN(age) AS min_age, 
             COUNT(age) AS count_age
      FROM employee_demographics
      GROUP BY gender) AS agg_table;
