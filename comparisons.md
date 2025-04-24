# Comparisons / Logical Operators
- Used within the `WHERE` and `HAVING` clause
- Used in conjunction with comparison operator
    - `=`, `<>`, `>`, `<`, `>=`, and `<=`
- Used in conjunction with logical operator
    - `AND`, `OR`, `BETWEEN`, and `IN`
```sql
SELECT 
    job_title_short, 
    job_location,
    job_via,
    salary_year_avg
FROM 
    job_postings_fact
WHERE 
    job_title = 'Data Analyst'
```