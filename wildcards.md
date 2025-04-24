# Wildcards
- Used to substitute one or more characters in a string
- Wildcards are used with `LIKE` operator
- All of this `LIKE`, `%`, AND `_` is used in the `WHERE` clause
```sql
SELECT 
    job_id, 
    job_title,
    job_title_short, 
    job_location
FROM 
	job_postings_fact 
WHERE 
    job_title LIKE '%Data%'
```

## %
- `%` - Represent zero, one or more characters 
```sql
SELECT 
	job_id, 
    job_title,
    job_title_short, 
    job_location
FROM 
	job_postings_fact 
WHERE 
	job_title LIKE '%Business%Analyst%'
```

## _ 
- `_` - Represent one, single character
```sql
SELECT 
	job_id, 
    job_title,
    job_title_short, 
    job_location
FROM 
	job_postings_fact 
WHERE 
	job_title LIKE 'Data_Analyst'
```