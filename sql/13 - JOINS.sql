# JOINS

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

# INNER
SELECT dem.employee_id, age, occupation
FROM employee_demographics dem
INNER JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
# INNER
SELECT dem.employee_id, age, occupation
FROM employee_demographics dem
INNER JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;