# `NULL` values
- `NULL` - A filed with no value
- **Note**: This differs from a filed with a `0` value or a filed containing spaces (i.e., `" "`) 
```sql
SELECT 
	job_title_short,
    job_location,
    job_via,
    salary_year_avg
FROM 
	job_postings_fact
WHERE
	salary_year_avg IS NOT NULL
ORDER BY
	salary_year_avg
```