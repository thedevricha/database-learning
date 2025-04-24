CREATE TABLE 
    jan_2023_jobs 
AS
    (
        select 
           *
        from 
            job_postings_fact
        where 
            EXTRACT(MONTH FROM job_posted_date) = 1
    );

SELECT * FROM jan_2023_jobs LIMIT 5;