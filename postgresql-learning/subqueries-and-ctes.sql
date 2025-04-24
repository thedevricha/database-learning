WITH january_jobs AS ( -- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)-- CTE definition ends here

SELECT * FROM january_jobs;

SELECT * 
FROM ( -- subquery start
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs; -- subquery end

SELECT 
    company_id,
    name AS company_name
FROM company_dim
WHERE company_id IN (
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
    ORDER BY company_id
);

WITH company_job_count AS ( -- CTE definition starts here
    SELECT 
        company_id,
        COUNT(*) AS job_count
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT 
    company_dim.name AS company_name,
    company_job_count.job_count
FROM company_dim
LEFT JOIN company_job_count ON company_dim.company_id = company_job_count.company_id
ORDER BY job_count DESC