# Day 21 — [Sep 16, 2026]

## Topic

TRIGGERS and EVENTS

## What I did

**TRIGGERS**

- A TRIGGER is a block of code that executes automatically when an event takes place on a specific table.
    - ex. CREATE TRIGGER name (employee_insert)
    - AFTER INSERT ON table (employee_salary)
    - FOR EACH ROW
    - BEGIN (
    - INSERT INTO table (columns)
    - VALUES (NEW.columns)
    - )
    - END

**EVENTS**

- It's like a scheduled automator rather than a trigger when an event takes place.

## Key takeaway

- A TRIGGER happens when an EVENT takes place, whereas an EVENT takes place when it's scheduled.

## Tomorrow

DATA CLEANING and DATA ANALYSIS
