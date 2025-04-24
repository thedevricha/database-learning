# `CASE` Expression
- A `CASE` expression in SQL is a way to apply conditional logic within your SQL queries.
```sql
SELECT 
    CASE
        WHEN column_name = 'Value1' THEN 'Description for Value1'
        WHEN column_name = 'Value2' THEN 'Description for Value2'
        ELSE 'Other'
    END AS column_description
FROM
    table_name;
```
- `CASE`: Begins the expression
- `WHEN`: specifies the condition(s) to look at
- `THEN`: What to do when the condition is `TRUE`
- `ELSE`(optional):Provides output if none of the `WHEN` conditions are met
- `END`: Conclude the `CASE` expression