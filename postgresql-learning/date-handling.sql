SELECT 
    job_title AS title, 
    job_location AS location, 
    job_posted_date::DATE AS date 
FROM 
    job_postings_fact
LIMIT 5;

SELECT 
    job_title AS title, 
    job_location AS location, 
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM 
    job_postings_fact
LIMIT 5;

SELECT 
    job_title AS title, 
    EXTRACT(MONTH FROM job_posted_date) AS month,
    EXTRACT(YEAR FROM job_posted_date) AS year,
    EXTRACT(DAY FROM job_posted_date) AS day
FROM 
    job_postings_fact
LIMIT 5;
    