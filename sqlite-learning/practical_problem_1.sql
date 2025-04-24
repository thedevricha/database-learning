/* 
    Get job details for BOTH 'Data Analyst' or 'Business Analyst' positions
        - For 'Data Analyst', I want jobs only > $100k
        - For 'Business Analyst', I want jobs only > $70k
    Only includes jobs located in EITHER:
        - 'Boston, MA'
        - 'Anywhere'
*/

SELECT 
	job_id, 
    job_title_short, 
    job_location, 
    job_via, 
    salary_year_avg
FROM 
	job_postings_fact 
WHERE 
	job_location IN ('Anywhere', 'Boston, MA') AND 
    (
      (job_title_short = 'Data Analyst' AND salary_year_avg > 100000) OR 
      (job_title_short = 'Business Analyst' AND salary_year_avg > 70000)
    )
ORDER BY salary_year_avg 