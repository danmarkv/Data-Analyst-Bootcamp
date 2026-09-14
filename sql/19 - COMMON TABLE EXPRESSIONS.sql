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
SELECT AVG(avg_salary)
FROM CTE_Example
;


# Can't reference the CTE here
SELECT AVG(avg_salary)
FROM CTE_Example
;


# Example with more complex CTE
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
SELECT AVG(avg_salary)
FROM CTE_Example
;