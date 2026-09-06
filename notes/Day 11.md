# Day 11 — [Sep 6, 2026]

## Topic

HAVING vs WHERE

## What I did

- Using WHERE before GROUP BY is invalid because the aggregate hasn't happened yet. This is where HAVING comes in.
- HAVING comes after GROUP BY and then the aggregate is used.
- HAVING is only going to work for aggregated functions after the GROUP BY runs.

## Key takeaway

- Use WHERE when filtering individual rows **before** any grouping or aggregation happens.
- Use HAVING if you want to filter the aggregated columns **after** a GROUP BY clause runs.

## Tomorrow

LIMIT and ALIASING
