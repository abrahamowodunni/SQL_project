SELECT
    count(job_id) as job_posted,
    EXTRACT(MONTH from job_posted_date) as month
from job_postings_fact
group by month
ORDER BY job_posted DESC
-- LIMIT 5;