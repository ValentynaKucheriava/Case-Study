-- Average Salary by Job Title

SELECT job_title, ROUND (AVG (salary_in_usd),0) AS avg_salary
FROM salaries
GROUP BY job_title 
ORDER BY avg_salary DESC
LIMIT 10;
