/* COMPARISON PRACTICE */
/* Question 1: In the job_postings_fact table get the columns job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Only return rows where the job location  is in 'Tampa, FL' */
SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact WHERE job_location = 'Tampa, FL';

/* Question 2: In the job_postings_fact table get the columns job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Only return 'Full-Time' jobs */
SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact WHERE job_schedule_type = 'Full-time';

/* Question 3: In the job_postings_fact table get the columns job_id, job_title_short, job_location, job_via, and salary_year_avg columns. Only look at jobs that are not 'Part-Time' jobs */
SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact WHERE NOT job_schedule_type = 'Part-time';
SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact WHERE job_schedule_type != 'Part-time';

/* Question 4: In the job_postings_fact table only get jobs that have an average yearly salary of $65000 or greater. Also get the columns job_id, job_title_short, job_location, job_via, and salary_year_avg columns. */
SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact WHERE salary_year_avg >= 65000;

/* Question 5: In the job_postings_fact table only get jobs that have an average yearly salary greater than %55,000. Also get the columns job_id, job_title_short, job_location, job_via, and salary_year_avg columns. */
SELECT job_id, job_title_short, job_location, job_via, salary_year_avg
FROM job_postings_fact WHERE salary_year_avg > 55000 ORDER BY salary_year_avg 