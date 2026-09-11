# CASE STATEMENTS

SELECT first_name, last_name, age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age > 50 THEN "On Death's Door"
END age_bracket
FROM employee_demographics;

SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary >= 50000 THEN salary + (salary * 0.07)
END new_salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.1
END bonus
FROM employee_salary;

# SUBQUERIES
