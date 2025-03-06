-- Group By

SELECT *
FROM organization_management.employee_demographics;



SELECT gender
FROM organization_management.employee_demographics
GROUP BY gender
;

SELECT gender, avg(age)
FROM organization_management.employee_demographics
GROUP BY gender
;


SELECT *
FROM organization_management.employee_salary;

SELECT occupation
FROM organization_management.employee_salary
GROUP BY occupation
;


SELECT occupation, salary
FROM organization_management.employee_salary
GROUP BY occupation, salary
;


SELECT gender, avg(age), max(age), min(age), count(age)
FROM organization_management.employee_demographics
GROUP BY gender
;






-- orber by

SELECT *
FROM organization_management.employee_demographics
order by first_name
;

SELECT *
FROM organization_management.employee_demographics
order by first_name ASC
;

SELECT *
FROM organization_management.employee_demographics
order by first_name DESC
;


SELECT *
FROM organization_management.employee_demographics
order by gender, age
;

SELECT *
FROM organization_management.employee_demographics
order by age, gender
;

SELECT *
FROM organization_management.employee_demographics
order by gender, age DESC
;


SELECT *
FROM organization_management.employee_demographics
order by 5, 4
;