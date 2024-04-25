<h1 align="center">Data Analysis using Tableau & SQL <a href="https://public.tableau.com/app/profile/valentyna.kucheriava/vizzes" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/mrankitgupta/mrankitgupta/a768d6bf0a001f03327578ae12f8867e4056cbaf/tableau-software.svg" alt="tableau" width="55" height="40"/> </a> </h1>

The data used in this project is the [Data Science Salaries 2023](https://www.kaggle.com/datasets/arnabchaki/data-science-salaries-2023/data) dataset from Kaggle. The objective of this work is to produce data visualizations using the Tableau tool and SQL queries in PostgreSQL.

## Data Transformation
I observed that the majority of values are in their abbreviated form, which, if displayed as such in reports, could be ambiguous, so adjusted these values.
* remote_ratio: Modified the values as [0 -> Office; 50 -> Hybrid; 100 -> Remote]
* employment_type: Modified the values as [CT -> Contract; FT -> Full Time; FL -> Freelance; PT -> Part Time]
* company_size: Modified the values as [L -> Large; M -> Medium; S -> Small]
* Company Location/Employee Residence: Modified the values as [DK -> Denmark; CZ -> Czech Republic; US -> United States of America; CA -> Canada etc.]
* A new category called 'Job Group' was created based on the 'job_title'.
## SQL
### Average Salary/Number of jobs
* What are the top 10 job titles with the highest average salaries?
* What is the average salary in relation to the company's primary location?
* How does company size impact employee salaries?
* How does salary differ across different types of employment?
* Provide the top 10 most frequently occurring job offers.
* Have there been any significant fluctuations in salary or job popularity across the years?
* What is the difference between the number of jobs and the average salary for the 10 most common positions?
#### Question 1: What are the top 10 job titles with the highest average salaries?
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
SELECT company_location , 
	ROUND (AVG(salary_in_usd),0) AS AverageSalary,
	COUNT (company_location) AS NumberJobs
FROM salaries
GROUP BY company_location
ORDER BY AverageSalary DESC
LIMIT 10; 
```
| company_location | AverageSalary | NumberJobs| 
| -----------------------------------| ----------------|-----|
| Israel                  | 271447     | 2    
| Puerto Rico             | 167500     | 4    
| United States of America| 151822     | 3040 
| Russian Federation      | 140333     | 3    
| Canada                  | 131918     | 87   
| New Zealand             | 125000     | 1    
| Bosnia and Herzegovina  | 120000     | 1    
| Ireland                 | 114943     | 7    
| Japan                   | 114127     | 6    
| Sweden                  | 105000     | 2    

#### Question 3: How does company size impact employee salaries?
```
SELECT company_size, ROUND(AVG(salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY company_size
ORDER BY AverageSalary DESC; 
```
| company_size  | AverageSalary |
| -----------------------------------| ----------------|
|Medium       |143131
|Large	       |118301
|Small	       |78227


#### Question 4: How does salary differ across different types of employment?
```
SELECT employment_type, ROUND(AVG(salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY employment_type
ORDER BY AverageSalary DESC; 
```
| employment_type  | AverageSalary |
| -----------------------------------| ----------------|
|Full-Time	|138314
|Contact	|113447
|Freelance	|51808
|Part-Time	|39534

#### Question 5: Provide the top 10 most frequently occurring job offers.
```
SELECT job_title, COUNT (*) AS NumberJobs
FROM salaries
GROUP BY job_title
ORDER BY Numberjobs DESC
LIMIT 10;
```
|job_title| NumberJobs |
| --------------------| ----------------|
|Data Engineer	|1040
|Data Scientist	|840
|Data Analyst	|612
|Machine Learning Engineer	|289
|Analytics Engineer	|103
|Data Architect	|101
|Research Scientist	|82
|Data Science Manager	|58
|Applied Scientist	|58
|Research Engineer	|37


#### Question 6: Have there been any significant fluctuations in salary or job popularity across the years?
```
SELECT work_year, 
       COUNT(*) as number_jobs,
       ROUND (AVG(salary_in_usd),0) AS AverageSalary
FROM salaries
GROUP BY work_year
ORDER BY AverageSalary ASC;
```
|work_year| NumberJobs | AverageSalary
| -----------------------------------| ----------------| ----------------|
|2020	|76	|92303
|2021	|230	|94087
|2022	|1664	|133339
|2023	|1785	|149046

#### Question 7: What is the difference between the number of jobs and the average salary for the 10 most common positions?  
```
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
| Applied Scientist         | 58        | 190264         |
| Research Engineer         | 37        | 163108         |


* Companies with medium size population pay more than large sized companies
* Employees working full time either from office or remote location earn significantly more than people working in hybrid mode

## Data Visualisation 

Original visualization: [Tableau Public](https://public.tableau.com/app/profile/valentyna.kucheriava/vizzes) 



