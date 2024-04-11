-- Average Salary by Job Title

SELECT job_title, ROUND (AVG (salary_in_usd),0) AS avg_salary
FROM salaries
GROUP BY job_title 
ORDER BY avg_salary DESC
LIMIT 10;

-- Average Salary by Organisation's Country 

SELECT "company_location " , ROUND (AVG(salary_in_usd),0) AS DD
FROM salaries
GROUP BY "company_location "
ORDER BY DD DESC
LIMIT 10; 

-- Average Salary by Company Size

SELECT company_size, ROUND(AVG(salary_in_usd),0) AS Size
FROM salaries
GROUP BY company_size
ORDER BY Size DESC; 

--  Average Salary by employment Type

SELECT employment_type, ROUND(AVG(salary_in_usd),0) AS bb
FROM salaries
GROUP BY employment_type
ORDER BY bb DESC; 

--Top 10 Frequent Job Titles with salary in USD 

SELECT job_title,
       COUNT(*) as number_jobs,
       ROUND (AVG(salary_in_usd),0) as avg_salary
FROM salaries
WHERE job_title IN ('Data Analyst', 
                    'Data Scientist', 
                    'Data Engineer',
                    'Analytics Engineer',
                    'Machine Learning Engineer', 
                    'Research Scientist', 
                    'Data Architect', 
                    'Research Engineer', 
                    'Appplied Scientist', 
                    'Data Science Manager')
GROUP BY job_title
ORDER BY number_jobs DESC;
