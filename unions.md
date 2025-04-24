# `UNION` Operators
- Combine result sets of two or more `SELECT` statements into a single result set.
- `UNION`: Remove duplicate rows
- `UNION ALL`: Include all duplicate rows
- **Note**: Each `SELECT` statement within the `UNION` must have the same number of columns in the result sets with similar data types.

## `UNION`
```sql
SELECT column_name
FROM table_one

UNION

SELECT column_name
FROM table_two;
```

## `UNION ALL`
```sql
SELECT column_name
FROM table_one

UNION ALL

SELECT column_name
FROM table_two;
```