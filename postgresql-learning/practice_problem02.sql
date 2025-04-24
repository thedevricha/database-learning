/* 
    Find the count of the number of remote job postings per skill
        - Display the top 5 skills by their demand in remote job
        - Include skill ID, name and count of posting requiring skill
*/

WITH remote_job_skills AS (
    SELECT 
    skill_id,
    COUNT(*) AS skill_count
    FROM
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS job_posting 
    ON skills_to_job.job_id = job_posting.job_id 
    WHERE 
        job_posting.job_work_from_home = True AND
        job_posting.job_title_short = 'Data Analyst'

    GROUP BY skill_id
)

SELECT 
    skills.skill_id,
    skills as skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY skill_count DESC
LIMIT 5;
