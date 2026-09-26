# Day 23 — [Sep 28, 2027]

## Topic

Excel Formulas

## What I did

- MAX/MIN - find highest/lowest number/value in a date range.
    - =MAX(cell1, cell2)
    - =MIN(cell1, cell2)
- IF/IFS - IF is a condition, IFS is multiple conditions.
    - =IF(condition, if_condition_true, if_condition_false)
    - IFS(condition1, if_condition1_true, condition2, if_condition2_true, condition3, if_condition3_true...)
        - It doesn't have an "If false" value. It defaults to #N/A if no condition is set to that value.
- LEN - returns the number of characters in a text string. It counts spaces also.
    - =LEN(cell/cell_range)
- LEFT/RIGHT - choose a certain part of a text string and extract the text from it. Like using SUBSTRING.
    - LEFT(cell, number_of_characters_to_extract)
    - RIGHT(cell, number_of_characters_to_extract)
        - Very usable when dealing with extracting data from dates.
        - Data must be in text type, it doesn't work when data is in date type.
- DateToText - convert a value to text in a specific number format.
    - = TEXT(cell, "dd/mm/yyyy")
        - Convert date type cell into text type.
- TRIM - removes unwanted spaces from cells expect for single spaces. ex. Dan Mark
    - TRIM(cell)
- CONCATENATE - joins two or more strings into one string.
    - CONCATENATE(cell_first_name, " ", cell_last_name)
    - CONCAT() vs CONCATENATE()
        - CONCAT accepts cell ranges in the parameters.
        - CONCATENATE does not.
- SUBSITUTE - replace an old string with new string in a text string.
    - SUBSTITUTE(cell, old_text, new_text, instance_num?)
    - instance_num - is the instance to replace. Blank is replacing all instances of the old text with the new text.
    - instance_num = 1 ("/" -> "-")
        - 3/23/1997 -> 3-23/1997
    - instance_num = 2 ("/" -> "-")
        - 3/23/1997 -> 3/23-1997
- SUM/SUMIF/SUMIFS - SUM adds up all the numbers in a range, SUMIF adds up all the numbers in a range if it meets a certain criteria. SUMIFS is just SUMIF with mutilple criteria/conditions.
    - SUM(cell_range, cell_range2,...)
    - SUMIF(cell_range, criteria)
        - SUMIF(A1:A5, ">50000")
            - sums all the numbers in the range if their value is greater than 50000
    - SUMIFS(cell_range, criteria_range1, criteria1, criteria_range2, criteria2, ...)
        - A - salary, B - gender, C - age
        - SUMIFS(A1:A5, B2:B5, "Male", C1:C5, ">30")
            - sums all the salary in the range if their gender is Male and their age is greater than 30.
- COUNT/COUNTIF/COUNTIFS - COUNT counts all the numbers in a range that contain numbers. COUNTIF counts all the numbers in a range if they meet the condition. COUNTIFS counts all the numbers in a range if they meet a set of conditions.
    - COUNT(cell_range1, cell_range2)
    - COUNTIF(cell_range, criteria)
    - COUNTIFS(cell_range1, criteria1, cell_range2, criteria2, ...)
- DAYS/NETWORKDAYS - DAYS count the number of days between two dates. NETWORKDAYS returns the number of whole workdays between two dates.
    - DAYS(end_date, start_date)
    - NETWORKDAYS(start_date, end_date, holidays?)

## Key takeaway

There are lots of formulas but these are the most commonly used in actual jobs.

## Tomorrow

XLOOKUP
