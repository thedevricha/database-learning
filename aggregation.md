# Aggregation
## Aggregation function:
- These functions computes a single result from input values.
    - `SUM()`: Add together all values in a specific column.
    - `COUNT()`: Counts the number of rows that match a specified condition. 
    - `AVG()`: Calculates the average value of a numerical column.
    - `MAX()`: Finds the maximum value in a set of values.
    - `MIN()`: Finds the minimum value in a set of values.
 
```sql
SELECT 
	SUM(salary_year_avg) AS salary_sum,
    COUNT(*) AS count_rows,
   	COUNT(DISTINCT job_title_short) AS job_type_total,
   	AVG(salary_year_avg) AS salary_avg,
    MAX(salary_year_avg) AS salary_max,
    MIN(salary_year_avg) AS salary_min
FROM 
	job_postings_fact
```

## GROUP BY:
- `GROUP BY` - Groups rows that have the same values into summary rows
- E.g. "Total number of sales by each item"
- **Note**: If you have an aggregate function, you need to include every column that's not aggregated (if not it gives an error)
```sql
SELECT 
	job_title_short AS jobs,
   	AVG(salary_year_avg) AS salary_avg,
    MAX(salary_year_avg) AS salary_max,
    MIN(salary_year_avg) AS salary_min
FROM 
	job_postings_fact
GROUP BY
	job_title_short
ORDER BY
	salary_avg
```

## HAVING:
- `HAVING` - Filter query based on aggregate function and grouping
- Used because you can't use aggregate function in `WHERE`  
```sql
SELECT 
	job_title_short AS jobs,
    COUNT(job_title_short) AS job_count,
   	AVG(salary_year_avg) AS salary_avg,
    MAX(salary_year_avg) AS salary_max,
    MIN(salary_year_avg) AS salary_min
FROM 
	job_postings_fact
GROUP BY
	job_title_short
HAVING 
	COUNT(job_title_short) > 100
ORDER BY
	salary_avg
```