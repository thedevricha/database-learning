# Subqueries and CTEs
- Subqueries and Common Table Expression (CTEs): Used for organizing and simplifying complex queries.
- Helps break down the query into smaller, more manageable parts
- When to use one over the other?
    - **Subqueries** are for simpler queries
    - **CTEs** are for more complex queries

## Subqueries
- Query within another query
- It can be used in `SELECT`, `FROM`, `WHERE` or `HAVING` clauses.
- It's executed first, and the results are passed to outer query
- It is used when you want to perform a calculation before the main query can complete its calculation
```sql
SELECT * 
FROM ( -- subquery start
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs;
-- subquery end
```

## Common Table Expression (CTEs)
- Define a temporary **result set** that you can reference within a `SELECT`, `INSERT`, `UPDATE` or `DELETE` statements
- Exists only during the execution of a query
- It's defined query that can be referenced in the main query or other CTEs
- `WITH` - used to define CTE at the beginning of a query
```sql
WITH january_jobs AS ( -- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)-- CTE definition ends here

SELECT * FROM january_jobs;
```