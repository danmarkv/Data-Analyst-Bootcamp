# Day 13 — [Sep 8, 2026]

## Topic

JOINS

## What I did

- JOINS allow you to combine 2 or more tables together if they have a common column.
    - The column doesn't necessarily need to have the same name but at least have the same data within it.
- Types of JOIN
    - By default, only using JOIN is equal to using INNER JOIN.
    - INNER
        - INNER JOINS returns rows that are the same in both columns in both tables.
        - ex. Joining employee_demographics and employee_salary with a common columnc called employee_id.
            - FROM employee_demographics dem JOIN employee_salary sal ON dem.employee_id = sal.employee_id
    - OUTER has 2 types: LEFT JOIN and RIGHT JOIN or LEFT OUTER and RIGHT OUTER
        -
    - SELF

## Key takeaway

- INNER JOIN is used when combining 2 or more tables using similar columns.

## Tomorrow

OUTER JOIN
