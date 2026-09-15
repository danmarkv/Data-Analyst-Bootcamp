# Day 20 — [Sep 15, 2026]

## Topic

TEMPORARY TABLES

## What I did

- TEMPORARY TABLES are tables that are only visible to the session that they are created at.
    - A session lasts until you exit out of MySQL Workbench.
- It can be used for storing intermediate results for complex queries somewhat like a CTE.
- CTE vs TEMP TABLE
    - CTE is recommended to be used by only 1 transformation
        - Best for small datasets, query readability, recursion
    - TEMP TABLE is more complex
        - Used in large datasets, complex joins, multiple reuses

## Key takeaway

TEMP TABLES are used for complex queries

## Tomorrow

STORED PROCEDURES
