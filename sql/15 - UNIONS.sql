# UNIONS

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;



SELECT first_name, last_name, 'Old Man' Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;

# STRING FUNCTIONS

-- LENGTH
SELECT LENGTH('skyfall');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2;

-- UPPER FIRST
SELECT UPPER('sky');

SELECT first_name, UPPER(first_name)
FROM employee_demographics
ORDER BY 2;


-- TRIM
SELECT LTRIM('          sky     ');

-- SUBSTRING
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) birth_month
FROM employee_demographics;

-- REPLACE
SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

-- LOCATE
SELECT LOCATE('e','Alexander'); -- 4

SELECT first_name, LOCATE('nn', first_name)
FROM employee_demographics;

-- CONCATINATE
SELECT first_name, last_name,
CONCAT(first_name, last_name)
FROM employee_demographics;