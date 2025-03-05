DROP DATABASE IF EXISTS `Organization_Management`;
CREATE DATABASE `Organization_Management`;
USE `Organization_Management`;

CREATE TABLE employee_demographics (
  employee_id INT NOT NULL,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  birth_date DATE,
  PRIMARY KEY (employee_id)
);

CREATE TABLE employee_salary (
  employee_id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  occupation VARCHAR(50),
  salary INT,
  dept_id INT
);

INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)
VALUES
(1, 'Prayma', 'Bishshash', 44, 'Female', '1979-09-25'),
(3, 'Prianka', 'Khan', 36, 'Female', '1987-03-04'),
(4, 'Asif', 'Khan', 29, 'Male', '1994-03-27'),
(5, 'Sonda', 'Biswas', 61, 'Female', '1962-08-28'),
(6, 'Toma', 'Zaman', 46, 'Female', '1977-07-30'),
(7, 'Nirob', 'Sharker', 35, 'Male', '1988-12-01'),
(8, 'Ashik', 'Zaman', 43, 'Male', '1980-11-11'),
(9, 'Emtyaz', 'Ebon', 38, 'Male', '1985-07-26'),
(10, 'Rupa', 'Khatun', 34, 'Female', '1989-03-25'),
(11, 'Priya', 'Hossain', 40, 'Female', '1983-06-14'),
(12, 'Pb', 'Rahman', 37, 'Male', '1986-07-27');

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES
(1, 'Prayma', 'Bishshash', 'Deputy Director of Organization', 75000, 1),
(2, 'Khusi', 'Islam', 'Director of Organization', 70000, 1),
(3, 'Prianka', 'Khan', 'Entrepreneur', 50000, 1),
(4, 'Asif', 'Khan', 'Assistant to the Director of Organization', 25000, 1),
(5, 'Sonda', 'Biswas', 'Office Manager', 50000, 1),
(6, 'Toma', 'Zaman', 'Office Manager', 60000, 1),
(7, 'Nirob', 'Sharker', 'Nurse', 55000, 4),
(8, 'Ashik', 'Zaman', 'City Manager', 90000, 3),
(9, 'Emtyaz', 'Ebon', 'State Auditor', 70000, 6),
(10, 'Rupa', 'Khatun', 'Shoe Shiner and Musician', 20000, NULL),
(11, 'Priya', 'Hossain', 'City Planner', 57000, 3),
(12, 'Pb', 'Rahman', 'Organization Director', 65000, 1);

CREATE TABLE organization_departments (
  department_id INT NOT NULL AUTO_INCREMENT,
  department_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO organization_departments (department_name)
VALUES
('Organization Management'),
('Animal Control'),
('Public Works'),
('Healthcare'),
('Library'),
('Finance');
