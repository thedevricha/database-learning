# Handling Dates

**Date Functions in SQL**: Used to perform operations on date and time values
- `::DATE`: Convert to a date format by removing the time portion
- `AT TIME ZONE`: Converts a timestamp to a specified tme zone
- `EXTRACT`: Gets specific date parts (e.g., year, month, day)

## ::DATE
```sql
SELECT 
    timestamp_column::DATE AS date_column
FROM
    table_name;
```
- `::` used for casting, which means converting a value from one date type to another
    - You can use it to convert a host of different data types
    ```sql
    SELECT 
        '2025-02-19'::DATE,'123'::INTEGER, 'true'::BOOLEAN, 
        '3.14'::REAL;
    FROM
        table_name;
    ```