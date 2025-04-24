# AS
- `AS` - Rename a column in a table; a temporary name (alias)
- Make column name more readable

```sql
SELECT 
	job_id, 
    job_title_short, 
   	job_location, 
    job_via AS job_posted_site,
    job_posted_date,
    salary_year_avg AS avg_yearly_salary
FROM 
	job_postings_fact 
```