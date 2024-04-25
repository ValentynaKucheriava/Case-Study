-- What are the top 10 job titles with the highest average salaries?
SELECT job_title, 
	ROUND (AVG (salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY job_title 
ORDER BY AverageSalary DESC
LIMIT 10;

-- What is the average salary and number of jobs in relation to the company's primary location?
SELECT company_location , 
	ROUND (AVG(salary_in_usd),0) AS AverageSalary,
	COUNT (company_location) AS NumberJobs
FROM salaries
GROUP BY company_location
ORDER BY AverageSalary DESC
LIMIT 10; 

-- How does company size impact employee salaries?
SELECT company_size, 
	ROUND(AVG(salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY company_size
ORDER BY AverageSalary DESC; 

-- How does salary differ across different types of employment?
SELECT employment_type, 
	ROUND(AVG(salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY employment_type
ORDER BY AverageSalary DESC; 


-- Provide the top 10 most frequently occurring job offers.
SELECT job_title, 
	COUNT (*) AS NumberJobs
FROM salaries
GROUP BY job_title
ORDER BY Numberjobs DESC
LIMIT 10;

-- Have there been any significant fluctuations in salary or job popularity across the years?
SELECT work_year, 
		COUNT(*) as number_jobs,
		ROUND (AVG(salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY work_year
ORDER BY AverageSalary ASC;

-- What is the difference between the number of jobs and the average salary for the 10 most common positions?
SELECT job_title,
       COUNT(*) as number_jobs,
       ROUND (AVG(salary_in_usd),0) as AverageSalary
FROM salaries
WHERE job_title IN ('Data Analyst', 
                    'Data Scientist', 
                    'Data Engineer',
                    'Analytics Engineer',
                    'Machine Learning Engineer', 
                    'Research Scientist', 
                    'Data Architect', 
                    'Research Engineer', 
                    'Applied Scientist', 
                    'Data Science Manager')
GROUP BY job_title
ORDER BY number_jobs DESC;
