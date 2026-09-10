# Day 15 — [Sep 10, 2026]

## Topic

UNIONS and CASE STATEMENTS

## What I did

**UNIONS**

- UNIONS allow you to combine ROWS together.
- UNIONS by default uses DISTINCT.
    - So it only returns the rows with unique data.
- Use UNION ALL if you want to return all the rows of both tables.

**STRING FUNCTIONS**

- LENGTH
    - Determine the number of characters in a column.
    - ex. LENGTH(first_name)
- UPPER/LOWER
    - Turn string into upper case or lower case.
    - UPPER(first_name)
- TRIM
    - Removes the leading and trailing whitespaces.
    - LTRIM or left trim removes the left hand side whitespaces and RTRIM remove the right hand side.
    - LTRIM(' sky ') or RTRIM('sky ')
- SUBSTRING, LEFT, and RIGHT
    - Returns the characters until the specified number.
    - ex. first_name = 'Princess'
        - LEFT(first_name, 4)
            - Prin
        - RIGHT(first_name, 4)
            - cess
        - SUBSTRING(first_name, 3, 4)
            - ince
- REPLACE - needs 2 parameters
    - Replaces a character with a different character you want.
    - ex. first_name = 'Princess'
        - REPLACE(first_name, 'P', 'F')
        - Frincess
- LOCATE
    - Returns the first position of the located character.
    - ex. LOCATE('n', 'Princess') = 4
- CONCATINATE
    - Combine columns into a single column.

## Key takeaway

- UNIONS must have the same number of columns in order to work properly. Otherwise, an error will occur.

## Tomorrow
