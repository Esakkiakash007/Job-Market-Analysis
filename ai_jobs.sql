CREATE DATABASE ai_jobs_db;
USE ai_jobs_db;

CREATE TABLE ai_jobs (
    job_id VARCHAR(50),
    job_title VARCHAR(100),
    salary_usd INT,
    salary_currency VARCHAR(10),
    experience_level VARCHAR(10),
    employment_type VARCHAR(10),
    company_location VARCHAR(50),
    company_size VARCHAR(5),
    employee_residence VARCHAR(50),
    remote_ratio INT,
    required_skills TEXT,
    education_required VARCHAR(50),
    years_experience INT,
    industry VARCHAR(100),
    posting_date VARCHAR(20),
    application_deadline VARCHAR(20),
    job_description_length INT,
    benefits_score FLOAT,
    company_name VARCHAR(100)
);

SELECT COUNT(*) FROM ai_jobs;

SELECT * FROM ai_jobs LIMIT 10;

SELECT job_title, ROUND(AVG(salary_usd), 0) AS avg_salary
FROM ai_jobs
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;

SELECT experience_level,
       COUNT(*) AS total_jobs,
       ROUND(AVG(salary_usd), 0) AS avg_salary,
       ROUND(MAX(salary_usd), 0) AS max_salary
FROM ai_jobs
GROUP BY experience_level
ORDER BY avg_salary DESC;

SELECT company_location,
       COUNT(*) AS total_jobs,
       ROUND(AVG(salary_usd), 0) AS avg_salary
FROM ai_jobs
GROUP BY company_location
ORDER BY total_jobs DESC
LIMIT 10;

SELECT 
    CASE 
        WHEN remote_ratio = 100 THEN 'Remote'
        WHEN remote_ratio = 50  THEN 'Hybrid'
        ELSE 'Onsite'
    END AS work_type,
    COUNT(*) AS total_jobs,
    ROUND(AVG(salary_usd), 0) AS avg_salary
FROM ai_jobs
GROUP BY work_type
ORDER BY avg_salary DESC;

SELECT company_size,
       COUNT(*) AS total_jobs,
       ROUND(AVG(salary_usd), 0) AS avg_salary
FROM ai_jobs
GROUP BY company_size
ORDER BY avg_salary DESC;