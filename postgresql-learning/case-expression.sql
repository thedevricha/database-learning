SELECT 
    count(job_id) AS job_count,
    CASE
        WHEN job_location = 'New York' THEN 'Local'
        WHEN job_location = 'Anywhere' THEN 'Remote'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
GROUP BY 
    location_category;