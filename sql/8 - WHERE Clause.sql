SELECT *
FROM employee_salary
WHERE salary <= 50000;
# WHERE salary >= 50000
# WHERE first_name = 'Leslie'

SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;
# OR NOT gender = 'male';
# OR gender = 'male';
# WHERE birth_date > '1985-01-01';
# WHERE gender != "Female"; # not female

# LIKE Statement
# % - anything
# _ - specific value so a__ is looking for a + 2 letters/values
SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%'
# WHERE first_name LIKE 'a___%';
# WHERE first_name LIKE '%er%';