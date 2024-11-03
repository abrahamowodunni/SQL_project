/*
What are the in demand skills for data analysis?
*/

SELECT 
    skills,
    COUNT(SJD.job_id) as demand_count
FROM job_postings_fact as JPF
INNER JOIN skills_job_dim as SJD on SJD.job_id = JPF.job_id
INNER JOIN skills_dim as SD on SD.skill_id = SJD.skill_id
WHERE JPF.job_title_short = 'Data Scientist'
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;