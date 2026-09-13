# Day 18 — [Sep 13, 2026]

## Topic

WINDOW FUNCTIONS

## What I did

- Works like a GROUP BY expect it doesn't roll out in one row. It shows the entire row with the aggregated output.
- Use OVER().
- WINDOWS FUNCTIONS allow you to add more information like first_name along with the aggregated column without using GROUP BY.
    - GROUP BY
        - SELECT gender, AVG(salary)
        - GROUP BY gender
    - WINDOW FUNCTION
        - SELECT gender, AVG(salary) OVER(PARTITION by gender)
        - no GROUP BY
- Can also use to find rolling total.
    - SELECT gender, AVG(salary) OVER(PARTITION by gender ORDER BY ed.first_name)
- Different Functions
    - ROW_NUMBER()
        - Assigns unique row numbers to the items.
    - RANK()
        - Assigns row numbers to the item and duplicates row number if data is identical.
        - The next number after the duplicate is the next number positionally, not numerically.
            - ex. two 5's, then the next rank is 7
            - if three 2's, then the next rank is 5
    - DENSE_RANK()
        - The next number after the duplicate is the next number numerically, not positionally.

## Key takeaway

WINDOW FUNCTIONS perform calculations across a set of related table rows without collapsing individual rows into a single summary output.

## Tomorrow

Advanced SQL Series
