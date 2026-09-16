# COMMON TABLE EXPRESSIONS

WITH CTE_Example AS
(
SELECT gender, 
AVG(salary) avg_salary, 
MAX(salary) max_salary, 
MIN(salary) min_salary, 
COUNT(salary) count_salary
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;


# Can't reference the CTE here
SELECT AVG(avg_salary)
FROM CTE_Example
;


# Example with more complex CTE
WITH CTE_Example AS
(
SELECT employee_id,
gender,
birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS 
(
SELECT employee_id,
salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;