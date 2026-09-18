# Day 23 — [Sep 18, 2026]

## Topic

Removing Duplicates

## What I did

-   1. Create a duplicate table to the original data set.
-   2. Find duplicates by using ROW_NUMBER() OVER(PARTITION BY...(column names))
-   3. Use CTE to filter row_num column
-   4. Verify the duplicates/make sure that really have the same data
-   5. Create another duplicate table to the filtered data (use copy Create Statement)
-   6. Delete duplicates

## Key takeaway

- Do not alter the original data set. Make a copy of it always.
- Save your progress by creating another table of the altered data set.

## Tomorrow

Standardizing Data
