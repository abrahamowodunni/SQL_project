/*
What are the top-paying Machine Learing jobs?
- I want to identify the top 10 highest-paying ML roles that are available remotely.
- Focused on job postings with specified salaries.
- So as to highlight the top-paying opportunities for ML, and have more insight into the skills needed etc. 
*/

SELECT
    job_id,
    job_title,
    job_location,
    CD.name as company_name,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM job_postings_fact AS JPF
LEFT JOIN company_dim AS CD ON JPF.company_id = CD.company_id
WHERE job_title_short = 'Data Scientist' AND
    job_location IN ('Anywhere', 'Arizona') AND
    salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;