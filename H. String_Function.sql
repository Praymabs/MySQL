-- Finding the length of a string "skyfall".
SELECT LENGTH("skyfall");

-- Retrieving the first name and its length from the employee_demographics table.
SELECT first_name, LENGTH(first_name)
FROM employee_demographics;

-- Sorting employees by the length of their first name in ascending order.
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

-- Converting the string "skyfall" to uppercase.
SELECT UPPER("skyfall");

-- Converting the string "skyfall" to lowercase.
SELECT LOWER("skyfall");

-- Converting first names in the table to uppercase.
SELECT first_name, UPPER(first_name)
FROM employee_demographics;

-- Converting first names in the table to lowercase.
SELECT first_name, LOWER(first_name)
FROM employee_demographics;

-- Removing leading and trailing spaces from the string "sky".
SELECT TRIM("          sky             ");

-- Removing trailing spaces only from the string "sky".
SELECT RTRIM("          sky             ");

-- Extracting the first 4 characters from each first name.
SELECT first_name, LEFT(first_name, 4)
FROM employee_demographics;

-- Extracting multiple string operations:
-- LEFT(first_name, 4): First 4 characters of the first name.
-- RIGHT(first_name, 4): Last 4 characters of the first name.
-- SUBSTRING(first_name, 3, 2): Extracting two characters from the 3rd position.
-- SUBSTRING(birth_date, 6,2): Extracting the birth month from the birth_date field.
SELECT first_name, 
    LEFT(first_name, 4),
    RIGHT(first_name, 4),
    SUBSTRING(first_name,3,2),
    birth_date,
    SUBSTRING(birth_date, 6,2) AS birth_month
FROM employee_demographics;

-- Replacing occurrences of the letter 'a' with '2' in first names.
SELECT first_name, REPLACE(first_name, 'a','2')
FROM employee_demographics; 

-- Finding the position of the letter 'm' in the word 'Prayma'.
SELECT LOCATE('m', 'Prayma');

-- Finding the position of the substring 'An' in each first name.
SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

-- Concatenating first name and last name with a space in between.
SELECT first_name, last_name,
    CONCAT(first_name, ' ', last_name)
FROM employee_demographics;

-- Same as the previous query but renaming the concatenated column as 'full_name'.
SELECT first_name, last_name,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;
