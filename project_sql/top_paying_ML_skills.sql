/*
What skills are reqiured for the top-paying ML jobs?
- Using the top 10 highest-paying ML jobs from the initial query 
- Adding the specific skills required for the roles
- This give details as to what I need to what an ML guy needs to successed
*/

WITH top_ML_job as (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        CD.name as company_name
    FROM job_postings_fact AS JPF
    LEFT JOIN company_dim AS CD ON JPF.company_id = CD.company_id
    WHERE job_title_short = 'Data Scientist' AND
        job_location IN ('Anywhere', 'Arizona') AND
        salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)

SELECT
    TMJ.*,
    skills
FROM top_ML_job as TMJ
INNER JOIN skills_job_dim as SJD ON SJD.job_id = TMJ.job_id
INNER JOIN skills_dim as SD on SD.skill_id = SJD.skill_id
ORDER BY TMJ.salary_year_avg DESC