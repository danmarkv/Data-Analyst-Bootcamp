# Day 20 — [Sep 15, 2026]

## Topic

TEMPORARY TABLES and STORED PROCEDURES

## What I did

**TEMPORARY TABLES**

- TEMPORARY TABLES are tables that are only visible to the session that they are created at.
    - CREATE TEMPORARY TABLE temp_table_name (SELECT...)
    - A session lasts until you exit out of MySQL Workbench.
- It can be used for storing intermediate results for complex queries somewhat like a CTE.
- CTE vs TEMP TABLE
    - CTE is recommended to be used by only 1 transformation
        - Best for small datasets, query readability, recursion
    - TEMP TABLE is more complex
        - Used in large datasets, complex joins, multiple reuses

**STORED PROCEDURES**

- STORED PROCEDURES are a way to save your code that you can reuse over and over.
- Just call it an it will execute all the code you wrote on the procedure.
- CREATE PROCEDURE procedure_name () SELECT...
- You can use a DELIMITER (ex. $$) to make MySQL identify when to stop the query.
    - DELIMITER $$
    - BEGIN
    - SELECT...
    - END
    - DELIMITER $$;
- You can also use PARAMETERS on Stored Procedures.
    - ex. CREATE PROCEDURE large_salaries4(employee_id INT)

## Key takeaway

TEMP TABLES are used for complex queries

## Tomorrow

TRIGGERS and EVENTS
