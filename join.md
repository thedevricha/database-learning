# JOINS
1. LEFT JOIN
2. RIGHT JOIN
3. INNER JOIN
4. FULL OUTER JOIN

## LEFT JOIN
```sql
SELECT 
	jpf.job_id,
	jpf.job_title_short AS title,
    cd.name AS company
FROM 
	job_postings_fact AS jpf
LEFT JOIN company_dim AS cd
	ON jpf.company_id = cd.company_id
```

## RIGHT JOIN
```sql
SELECT 
	jpf.job_id,
	jpf.job_title_short AS title,
    cd.name AS company
FROM 
	job_postings_fact AS jpf
RIGHT JOIN company_dim AS cd
	ON jpf.company_id = cd.company_id
```

## INNER JOIN
```sql
SELECT 
	jpf.job_id,
	jpf.job_title,
    sjd.skill_id,
    sd.skills
FROM 
	job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
	ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
	ON sjd.skill_id = sd.skill_id
```