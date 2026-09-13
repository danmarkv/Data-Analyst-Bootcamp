# WINDOW FUNCTIONS.

-- Using  GROUP BY
SELECT gender, AVG(salary) avg_salary
FROM employee_demographics ed
JOIN employee_salary es
ON ed.employee_id = es.employee_id
GROUP BY gender;

-- Using WINDOW FUNCTION
SELECT ed.first_name, 
ed.last_name,
gender, 
AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id;
    
-- Adding Rolling Total
SELECT ed.first_name, 
ed.last_name,
gender, 
salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY ed.first_name) rolling_total
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id;

-- ROW_NUMBER()
SELECT ed.employee_id,
ed.first_name, 
ed.last_name,
gender, 
salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) dense_num
FROM employee_demographics ed
JOIN employee_salary es
	ON ed.employee_id = es.employee_id;