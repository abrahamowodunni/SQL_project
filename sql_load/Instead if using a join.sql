-- Instead if using a join
SELECT
    name
from company_dim
WHERE company_id in (
    SELECT
        company_id
    FROM job_postings_fact
    where job_no_degree_mention = TRUE
)
