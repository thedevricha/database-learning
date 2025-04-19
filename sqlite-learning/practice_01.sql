/* BASICS PRACTICES */
/* Question 1: Get the unique job locations in the job_postings_fact table. Order in alphabetical order (ascending order) */
SELECT DISTINCT job_location
FROM job_postings_fact
ORDER BY job_location

/* Question 2: In the job_postings_fact table get the columns job_id, job_title_short, job_location, and job_via columns. Order it in ascending order by job_location */
SELECT job_id, job_title_short, job_location, job_via
FROM job_postings_fact
ORDER BY job_location

/* Question 3: In the job_postings_fact table get the columns job_id, job_title_short, job_location, job_via columns, and salary_year_avg. And only look at rows where job_title_short is 'Data Engineer' */
SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact
WHERE job_title_short = 'Data Engineer'