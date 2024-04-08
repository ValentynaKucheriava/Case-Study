<h1 align="center">Data Analysis using Tableau & SQL <a href="https://public.tableau.com/app/profile/valentyna.kucheriava/vizzes" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/mrankitgupta/mrankitgupta/a768d6bf0a001f03327578ae12f8867e4056cbaf/tableau-software.svg" alt="tableau" width="55" height="40"/> </a> </h1>

```
-- Top 10 Frequent Job Titles with salary in USD 
SELECT job_title,
       COUNT(*) as Numberjobs,
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
                    'Appplied Scientist', 
                    'Data Science Manager')
GROUP BY job_title
ORDER BY Numberjobs DESC;
```
