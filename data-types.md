# Data Types
- Data types specify the expected formate of a value.
- These are needed to be specified for **data integrity** to ensure only the correct data is stored in column.
- They also help database process data **more quickly** and store ot with **less space**
- Data types in PostgresSQL:
https://www.postgresql.org/docs/current/datatype.html

```sql
CREATE TABLE job_applied {
    job_id INT,
    application_sent_date DATE,
    custom_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(255)
}
```

## Common Examples
1. `INT`
    - An integer value: `123`
    - A whole number
    - Range: -2147483648 to +2147483647 for a regular `INT` (4 bytes)
2. `NUMERIC(precision, scale)`
    - A precise number with fixed decimal points
    - `precision` is the total number of digits, and
    - `scale` is number of digit to the right of the decimal point E.g. `123.456` with `NUMERIC(6,3)`
3. `TEXT`
    - A string character: `Hello World!`
    - Store variable-length string with unlimited length
    - Often used for storing long-form text that doesn't fit within the size constraints of `VARCHAR`
4. `VARCHAR(n)`
    - A variable-length string (where `n` is the maximum length): `Hello` with `VARCHAR(10)`
    - Provides a maximum character limit but can store strings of any length up to the limit.
5. `BOOLEAN`
    - Represents a logical entity that can be `true`, `false`, and `NULL`
    - Suitable for storing true/false values
6. `DATE`
    - A specific date without time: `2025-04-06`
    - Formate: `YYYY-MM-DD`
7. `TIMESTAMP`
    - A specific date and time without timezone:  `2025-04-06 15:04:05`
    - Formate: `YYYY-MM-DD HH:MI:SS`, capable of including seconds depending on the precision
8. `TIMESTAMP WITH TIME ZONE`
    - A specific date and time with time zone information:  `2025-04-06 15:04:05+00:00`.
    - Similar to `TIMESTAMP` but include time zone information
    - Adjustable stored time based on time zone
    - Useful for applications requiring time zone awareness