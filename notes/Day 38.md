# Day 38 — [Oct 6, 2026]

## Topic

Tableau Project

## What I did

- Create a Tabluea Project for the portfolio
    - Upload Excel file to Tableau
    - Drag Listing table to Sheet
    - Right Click then Open to create relationships to the tables
    - Look carefully which column has a relationship to another column because Id = Id might not be the same. Look for listing Id in this case
- Create first visualization
    - Price by Zipcode
    - Use a Bar in the Marks card
    - Column: Zipcode
    - Rows: AVG(Price)
    - Filters: exclude null Zipcode
    - Marks: Zipcode as
- Second vis.
    - Map of Price by Zipcode
    - Use Filled Map
    - Drag Zipcode and it will separate to:
        - Column: Longitude
        - Row: Latitude
    - Filters: exclude null Zipcode
    - Marks: Zipcode label, Zipcode color, AVG(Price) label
- Third
    - Revenue for each Week
    - Use Line chart
    - Column: Date(Week)
    - Row: SUM(price(calendar))
    - Filter: exclude first week of 2017
- Fourth
    - Avg Price Per Amount of Bedrooms
    - Use Bar chart
    - Column: Bedrooms table
    - Row: AVG(price)
    - Marks: AVG(price) label
- Fifth
    - Count of Listings Per Bedroom Amount
    - Row: Bedrooms table
    - Marks: CNTD(id)
    - Filters: null and 0

## Key takeaway

## Tomorrow
