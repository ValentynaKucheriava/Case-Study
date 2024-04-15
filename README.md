<h1 align="center">Data Analysis using Tableau & SQL <a href="https://public.tableau.com/app/profile/valentyna.kucheriava/vizzes" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/mrankitgupta/mrankitgupta/a768d6bf0a001f03327578ae12f8867e4056cbaf/tableau-software.svg" alt="tableau" width="55" height="40"/> </a> </h1>

The data used in this project is the Data Science Salaries 2023 dataset from Kaggle.

### Question 1: How does salary vary based on different job titles?
```
-- Average Salary by Job Title
SELECT job_title, ROUND (AVG (salary_in_usd),0) AS avg_salary
FROM salaries
GROUP BY job_title 
ORDER BY avg_salary DESC
LIMIT 10;
```
| job_title  | avg_salary |
| -----------------------------------| ----------------|
|Data Science Tech Lead	         |375000
|Cloud Data Architect	         |250000
|Data Lead	                       |212500
|Data Analytics Lead	                |211255
|Principal Data Scientist	         |198171
|Director of Data Science	         |195141
|Principal Data Engineer	         |192500
|Machine Learning Software Engineer  |192420
|Data Science Manager	         |191279
|Applied Scientist	                |190264

### Question 5: What is the difference between the number of jobs and the average salary for the 10 most common positions?  
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

| job_title  | number_jobs | avg_salary |
| ------------------------- | --------- | ---------------|
| Data Engineer             | 1040      | 142786         |
| Data Scientist            | 840       | 140870         |
| Data Analyst              | 612       | 108716         |
| Machine Learning Engineer | 289       | 154691         |
| Analytics Engineer        | 103       | 152369         |
| Data Architect            | 101       | 161714         |
| Research Scientist        | 82        | 161214         |
| Data Science Manager      | 58        | 191279         |
| Research Engineer         | 37        | 163108         |






