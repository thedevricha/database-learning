/* 
    Look for non-senior data analyst or business analyst roles
        - Only get job title that includes either 'Data' or 'Business'
        - Also include those with 'Analyst' in any part of the title
        - Don't include any job title with 'Senior' followed by any character
    Get the job title, location and average yearly salary
*/

SELECT 
	job_title,
    job_location,
    salary_year_avg
FROM 
	job_postings_fact 
WHERE 
    (job_title LIKE '%Data%' OR job_title LIKE '%Business%') AND
    job_title LIKE '%Analyst%' AND
    job_title NOT LIKE '%Senior%' 
    