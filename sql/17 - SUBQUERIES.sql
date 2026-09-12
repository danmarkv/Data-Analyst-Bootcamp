# SUBQUERIES 

-- in WHERE
SELECT *
FROM employee_demographics
WHERE employee_id IN 
				(SELECT employee_id
					FROM employee_salary
                    WHERE dept_id = 1);


-- in SELECT
SELECT first_name, salary,
(SELECT AVG(salary)
FROM employee_salary
) AS average_salary
FROM employee_salary
;


-- in FROM
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT AVG(max_age)
FROM (SELECT gender, AVG(age), MAX(age) max_age, MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS agg_table