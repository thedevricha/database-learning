/* 
    - Find the average salary and number of job postings for each skill for this:
        - Write query to list each unique skill from the `skill_dim` table.
        - Count how many job position mention each skill from the `skills_to_job_dim` table.
        - Calculate the average yearly salary for job postings associated with each skill.
        - Group the result by the skill name.
        - Order by the average salary.
    Hint: Use `LEFT JOIN` to combine skills_dim, skills_job_dim and job_postings_fact tables
*/

SELECT 
	sd.skills AS skill_name,
    COUNT(sjd.job_id) AS number_of_job_posting,
    AVG(jpf.salary_year_avg) AS average_salary_for_skill
FROM 
	skills_dim AS sd
LEFT JOIN skills_job_dim AS sjd
	ON sd.skill_id = sjd.skill_id
LEFT JOIN job_postings_fact AS jpf
	ON sjd.job_id = jpf.job_id
GROUP BY sd.skills
ORDER BY average_salary_for_skill DESC