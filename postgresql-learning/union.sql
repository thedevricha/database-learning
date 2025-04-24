SELECT 
    job_id,
    job_title_short
FROM january_jobs

UNION

SELECT 
    job_id,
    job_title_short
FROM february_jobs;
