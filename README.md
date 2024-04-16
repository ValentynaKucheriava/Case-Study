<h1 align="center">Data Analysis using Tableau & SQL <a href="https://public.tableau.com/app/profile/valentyna.kucheriava/vizzes" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/mrankitgupta/mrankitgupta/a768d6bf0a001f03327578ae12f8867e4056cbaf/tableau-software.svg" alt="tableau" width="55" height="40"/> </a> </h1>

The data used in this project is the [Data Science Salaries 2023](https://www.kaggle.com/datasets/arnabchaki/data-science-salaries-2023/data) dataset from Kaggle. The objective of this work is to produce data visualizations using the Tableau tool and SQL queries in PostgreSQL.

## Data Transformation
Ja observed that the majority of values are in their abbreviated form, which, if displayed as such in reports, could be ambiguous, so ja adjusted these values.
* remote_ratio: Modified the values as [0 -> Office; 50 -> Hybrid; 100 -> Remote]
* employment_type: Modified the values as [CT -> Contract; FT -> Full Time; FL -> Freelance; PT -> Part Time]
* Company Location/Employee Residence: Modified the values as [DK -> Denmark; CZ -> Czech Republic; US -> United States of America; CA -> Canada etc.]
## SQL
### Average Salary
* What are the top 10 job titles with the highest average salaries?
* What is the average salary in relation to the company's primary location?
* How does company size impact employee salaries?
* How does salary differ across different types of employment?
#### Question 1: What are the top 10 job titles with the highest average salaries??
```
SELECT job_title, ROUND (AVG (salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY job_title 
ORDER BY AverageSalary DESC
LIMIT 10;
```
| job_title  | AverageSalary |
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

#### Question 2: What is the average salary in relation to the company's primary location?
```
SELECT "company_location " , ROUND (AVG(salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY "company_location "
ORDER BY AverageSalary DESC
LIMIT 10; 
```

#### Question 3: How does company size impact employee salaries?
```
SELECT company_size, ROUND(AVG(salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY company_size
ORDER BY AverageSalary DESC; 
```

#### Question 4: How does salary differ across different types of employment?
```
SELECT employment_type, ROUND(AVG(salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY employment_type
ORDER BY AverageSalary DESC; 
```



#### Question 5: What is the difference between the number of jobs and the average salary for the 10 most common positions?  
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


* Companies with medium size population pay more than large sized companies
* Employees working full time either from office or remote location earn significantly more than people working in hybrid mode

## Data Visualisation 

Original visualization: [Tableau Public](https://public.tableau.com/app/profile/valentyna.kucheriava/vizzes) 



