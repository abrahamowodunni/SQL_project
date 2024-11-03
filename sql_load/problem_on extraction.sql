SELECT
    avg(salary_year_avg) as yearly_avg,
    avg(salary_hour_avg) as hourly_avg,
    EXTRACT(MONTH from job_posted_date) as month,
    EXTRACT(DAY from job_posted_date) as day,
    job_schedule_type
from job_postings_fact
where EXTRACT(MONTH from job_posted_date) > 5 and 
    EXTRACT(DAY from job_posted_date) > 1
GROUP BY job_schedule_type,
    month,
    day;