# Day 29 — [Sep 29, 2026]

## Topic

XLOOKUP

## What I did

- XLOOKUP - searches a range or an array for a match and returns the corresponding item from a second range or array. By default, an exact match is used.
    - XLOOKUP(lookup_value, lookup_array, return_array, if_not_found?, match_mode?, search_mode?)
        - lookup_value is the reference value
        - lookup_array is the array to use for searching (it has the lookup_value)
        - return_array is the array to find the match of the value
    - XLOOKUP(A3, I1:I5, P1:P5)
    - XLOOKUP(A3, I1:I5, P1:O5) multiple columns
    - XLOOKUP(A3, I1:I5, P1:P5, "Not Found") if exact match not found
    - XLOOKUP(A3, I1:I5, P1:P5, "Not Found", 2)
        - match_mode = 2 is wildcard character match. It looks for matches with that value but it needs and asterisk (\*).
        - ex. look for value that has a name before "Mark" on it. A3 = Mark
            - XLOOKUP("\*"&A3, I1:I5, P1:P5, "Not Found", 2)
    - XLOOKUP(A3, I1:I5, P1:P5, "Not Found", 1) looks for the next highest value (-1 is the opposite)
        - if A3 = 1/1/2000, it looks for the next higher date closest to that value
    - XLOOKUP(A3, I1:I5, P1:P5, , , 1) search mode is first-to-last (-1 is last to first)
        - if 2 different names have the same value, the earlier name is returned first for 1 and later name for -1
- XLOOKUP HORIZONTAL
    - look at excel for example
- XLOOKUP with SUM
    - SUM(XLOOKUP())

- VLOOKUP vs XLOOKUP
    - VLOOKUP(lookup_value, table_array, column_index_num, range_lookup?)
        - lookup_value - value to search
        - table_array - the range of array to search in
        - column_index_num - the number of column you want to search
        - range_lookup - has two values: TRUE appopriate match, FALSE exact match

## Key takeaway

## Tomorrow
