-- what are the highest paying skills for data engineer?
-- calculate  the median sal for each skills required in data engineer positions
--focus on more remote positions with specified salary
-- include skill frequency to identify both salary and demand 
--WHY ? Helps to identify which skills command the highest compensation while also showing 
-- how common those skills are, providing a more complete picture for skill development priorities
-- the MEDIAN is used instead of the average to r4duce the impact of outlier salaries

select 
sd.skills,
round(median(jpf.salary_year_avg),0) as median_sal,
count(jpf.*) as demand_count
from job_postings_fact as jpf
    inner join skills_job_dim as sjd on jpf.job_id = sjd.job_id
    inner join skills_dim as sd on sjd.skill_id = sd.skill_id
    where jpf.job_title_short in ('Data Engineer')
    and jpf.job_work_from_home = 'TRUE'
    GROUP BY sd.skills
    having 
    count(jpf.*) > 100
    order by median_sal desc
limit 25;

/*
-- RUST remains the top-paying skill at 210k median salary. though demand is still relatively limited (232) postings
┌────────────┬────────────┬──────────────┐
│   skills   │ median_sal │ demand_count │
│  varchar   │   double   │    int64     │
├────────────┼────────────┼──────────────┤
│ rust       │   210000.0 │          232 │
│ golang     │   184000.0 │          912 │
│ terraform  │   184000.0 │         3248 │
│ spring     │   175500.0 │          364 │
│ neo4j      │   170000.0 │          277 │
│ gdpr       │   169616.0 │          582 │
│ zoom       │   168438.0 │          127 │
│ graphql    │   167500.0 │          445 │
│ mongo      │   162250.0 │          265 │
│ fastapi    │   157500.0 │          204 │
│ django     │   155000.0 │          265 │
│ bitbucket  │   155000.0 │          478 │
│ crystal    │   154224.0 │          129 │
│ atlassian  │   151500.0 │          249 │
│ c          │   151500.0 │          444 │
│ typescript │   151000.0 │          388 │
│ kubernetes │   150500.0 │         4202 │
│ ruby       │   150000.0 │          736 │
│ airflow    │   150000.0 │         9996 │
│ node       │   150000.0 │          179 │
│ css        │   150000.0 │          262 │
│ redis      │   149000.0 │          605 │
│ vmware     │   148798.0 │          136 │
│ ansible    │   148798.0 │          475 │
│ jupyter    │   147500.0 │          400 │


*/