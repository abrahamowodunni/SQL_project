-- Using case. applies conditional logic 
SELECT
    job_title_short,
    job_location,
    case
        when job_location = 'Anywhere' then 'Remote'
        when job_location = 'Arizona' then 'Local'
        else 'Onsite'
    end as location_category
from job_postings_fact;