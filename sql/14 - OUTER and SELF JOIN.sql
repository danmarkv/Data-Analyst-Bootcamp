# OUTER JOIN
SELECT *
FROM employee_demographics dem
RIGHT OUTER JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
# SELF
SELECT emp1.employee_id emp_santa, 
emp1.first_name first_name_santa,
emp1.last_name last_name_santa,
emp2.employee_id emp_name, 
emp2.first_name first_name_emp,
emp2.last_name last_name_emp
# SELECT *
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

# JOINING MULTIPLE TABLES
SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
    ;
    
SELECT *
FROM parks_departments;