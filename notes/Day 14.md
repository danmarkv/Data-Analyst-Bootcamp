# Day 14 — [Sep 9, 2026]

## Topic

OUTER and SELF JOINS

## What I did

- OUTER JOINS have 2 types: LEFT JOIN and RIGHT JOIN or LEFT OUTER and RIGHT OUTER
    - LEFT is taking everything from the left table, and return the matches from the right table.
    - RIGHT is taking everything from the right table, but if there is no match from the left table, it returns **null.**
- SELF JOIN
    - A join that ties the table to itself.

## Key takeaway

- JOINS have 3 types:
    - INNER, OUTER, and SELF Joins
    - INNER JOIN is the same as using only JOIN
        - Returns rows that have a match in both tables.
        - Unmatched rows are excluded.
    - OUTER JOIN has 2 types: LEFT JOIN and RIGHT JOIN
        - LEFT JOIN
            - Returns ALL rows from the left table + matching rows from the right table.
            - Unmatched rows from the right table display as NULL.
        - RIGHT JOIN
            - Returns ALL rows from the right table + matching rows from the left table.
            - Unmatched rows from the left table display as NULL.
    - SELF JOIN
        - Joins a table by itself.

## Tomorrow

UNIONS
