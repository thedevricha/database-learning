CREATE TABLE 
    january_jobs 
AS
    (
        select 
           *
        from 
            job_postings_fact
        where 
            EXTRACT(MONTH FROM job_posted_date) = 1
    );

CREATE TABLE 
    february_jobs 
AS
    (
        select 
           *
        from 
            job_postings_fact
        where 
            EXTRACT(MONTH FROM job_posted_date) = 2
    );

CREATE TABLE 
    march_jobs 
AS
    (
        select 
           *
        from 
            job_postings_fact
        where 
            EXTRACT(MONTH FROM job_posted_date) = 3
    );