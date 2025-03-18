-- Calculate the average salary for each gender using GROUP BY
SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id
GROUP BY gender;

-- Calculate the overall average salary without grouping using a window function
SELECT gender, AVG(salary) OVER() AS overall_avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- Calculate the average salary for each gender using PARTITION BY (Window Function)
SELECT gender, AVG(salary) OVER(PARTITION BY gender) AS gender_avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- Show each employee's name along with the average salary for their gender
SELECT dem.first_name, dem.last_name, gender, 
       AVG(salary) OVER(PARTITION BY gender) AS gender_avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- Grouping by first name, last name, and gender while calculating average salary
SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender;

-- Calculate the total salary for each gender using a window function
SELECT dem.first_name, dem.last_name, gender,
       SUM(salary) OVER(PARTITION BY gender) AS total_salary_by_gender
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- Calculate rolling total salary for each gender, ordered by employee_id
SELECT dem.first_name, dem.last_name, gender, salary,
       SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- Assign a row number for each gender without ordering within gender
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
       ROW_NUMBER() OVER(PARTITION BY gender) AS row_num
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- Assign a row number for each gender, ordered by salary in descending order
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
       ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- Assign row number and rank within each gender based on salary (descending order)
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
       ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
       RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;

-- Assign row number, rank, and dense rank within each gender based on salary (descending order)
SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
       ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
       RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
       DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
   ON dem.employee_id = sal.employee_id;
