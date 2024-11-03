CREATE table Jan_jobs as 
    SELECT*
    from job_postings_fact
    WHERE EXTRACT(MONTH from job_posted_date) = 1;

-- we can do this for other months too. 

select *
from Jan_jobs
LIMIT 5; 