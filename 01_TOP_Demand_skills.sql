select *
from job_postings_fact
limit 10;
-- top 10 most demand skills


select 
sd.skills,
count(jpf.*) as demand_count
from job_postings_fact as jpf
    inner join skills_job_dim as sjd on jpf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
    where jpf.job_title_short in ('Data Engineer')
    and jpf.job_country = 'Czechia'
    and jpf.job_work_from_home = 'TRUE'
    GROUP BY sd.skills
    order by demand_count desc
limit 10;

/* 
KEY tateAways
--SQL and python still remain the top foundational Skills for data engineer
--  Aws is the most prefered CP in the czech republic
--big data tools like spark 
-- Data pipeline like airflow and  snowflake are the most valued in the czech republic
-- Java, word and Scala round out the other top 10 requested skills
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
 */

