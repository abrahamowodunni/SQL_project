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

/*
Key Insights:

Core Technical Skills:

SQL and Python appear most frequently, showing they're fundamental requirements
Java appears in multiple high-paying positions, suggesting it's valuable for ML engineering roles


Cloud Platforms:

AWS and GCP appear multiple times, indicating cloud expertise is important
Multiple jobs require knowledge of multiple cloud platforms (AWS + GCP)


ML Frameworks:

There's a balance between TensorFlow and PyTorch requirements
The Director level position at Teramind requires knowledge of multiple ML frameworks (TensorFlow, Keras, PyTorch, scikit-learn)


Big Data Technologies:

Spark, Hadoop, and Cassandra appear in data scientist roles
This suggests big data processing is an important skill


Job Title Patterns:

Titles include various levels: Staff, Principal, Distinguished, Director, Head of
Specialized roles exist (e.g., Battery Data Science)
Quant roles command higher salaries


Company Diversity:

Mix of traditional retail (Walmart), recruiting firms (Selby Jennings, Storm5), and specialized companies
Financial sector companies (Algo Capital Group) have comprehensive technical requirements



Recommendations for Job Seekers:

Focus on core skills: SQL and Python are must-haves
Get cloud certification in either AWS or GCP
Learn at least one major ML framework (TensorFlow or PyTorch)
Don't neglect big data technologies
Consider specializing in quantitative analysis for higher salaries

*/
