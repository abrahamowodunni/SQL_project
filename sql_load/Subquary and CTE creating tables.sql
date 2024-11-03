-- Subquary and CTE creating tables
SELECT *
FROM (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS jan_jobs; 

with january_jobs as (
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
)

SELECT 
    job_id,
    job_posted_date,
    job_via
from january_jobs;