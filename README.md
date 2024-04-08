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
### Question 1: What is the difference between the number of jobs and the average salary for the 10 most common positions?  
| job_title  | number_jobs | avg_salary |
| ------------------------- | ----------------------- | ---------------- |
| Data Engineer             | 1040                    | $142,786         |
| Data Scientist            | 840                     | $140,870         |
| Data Analyst              | 612                     | $108,716         |
| Machine Learning Engineer | 289                     | $154,691         |
| Analytics Engineer        | 103                     | $152,369         |
| Data Architect            | 101                     | $161,714         |
| Research Scientist        | 82                      | $161,214         |
| Data Science Manager      | 58                      | $191,279         |
| Research Engineer         | 37                      | $163,108         |






