# TEMPORARY TABLES

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)

);

INSERT INTO temp_table
VALUES('Alex', 'Freberg', 'Lord of the Rings: The Two Towers');

SELECT *
FROM temp_table;

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT * 
FROM salary_over_50k;



# STORED PROCEDURES

SELECT *
FROM employee_salary
WHERE salary >= 50000;

DELIMITER $$ 
CREATE PROCEDURE large_salaries3()
BEGIN
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;
END $$
DELIMITER ; 

CALL large_salaries3();

CALL large_salaries(); -- NOT BEST PRACTICE


# PARAMETERS
DELIMITER $$ 
CREATE PROCEDURE large_salaries4(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = p_employee_id
    ;
END $$
DELIMITER ; 

CALL large_salaries4(1);