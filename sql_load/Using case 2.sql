-- Using case. applies conditional logic 
SELECT
    count(job_id) as number_of_jobs,
    job_title_short,
    case
        when job_location = 'Anywhere' then 'Remote'
        when job_location = 'Arizona' then 'Local'
        else 'Onsite'
    end as location_category
from job_postings_fact
where job_title_short like 'Data%'
GROUP BY location_category,
    job_title_short;