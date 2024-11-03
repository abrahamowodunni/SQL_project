with remote_job_skills as (
    SELECT
        skill_id,
        count(*) as skill_count
    FROM skills_job_dim as sjd
    INNER JOIN job_postings_fact as jpf on sjd.job_id = jpf.job_id
    where jpf.job_work_from_home = TRUE AND
         jpf.job_title_short like 'Machine%'
    GROUP BY skill_id
)

SELECT
    sd.skill_id,
    skills,
    skill_count
FROM remote_job_skills as rjs
INNER JOIN skills_dim as sd on sd.skill_id = rjs.skill_id
ORDER BY skill_count DESC
LIMIT 5;