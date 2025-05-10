-- #view the sample data
SELECT * FROM hr.hr_analysis limit 10;


-- #checking missing values in each column
select
  COUNT(*) AS total_rows,
  SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_Age,
  SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS missing_attrition,
  SUM(CASE WHEN BusinessTravel IS NULL THEN 1 ELSE 0 END) as missing_businesstravel,
  SUM(CASE WHEN DailyRate IS NULL THEN 1 ELSE 0 END) AS missing_dailyrate,
  SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS missing_department,
  sum(case when DistanceFromHome is null then 1 else 0 end) as missing_distancefromhome,
  SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS missing_education,
  SUM(CASE WHEN EducationField IS NULL THEN 1 ELSE 0 END) AS missing_educationfield,
  SUM(CASE WHEN EmployeeCount IS NULL THEN 1 ELSE 0 END) AS missing_employeecount,
  SUM(CASE WHEN EmployeeNumber IS NULL THEN 1 ELSE 0 END) AS missing_employeenumber,
  sum(case when EnvironmentSatisfaction is null then 1 else 0 end) as missing_environmentsatisfaction,
  sum(case when hourlyrate is null then 1 else 0 end) as missing_hourlyrate,
  sum(case when DistanceFromHome is null then 1 else 0 end) as missing_distancefromhome,
  sum(case when PerformanceRating is null then 1 else 0 end) as missing_performancerating,
  sum(case when PercentSalaryHike is null then 1 else 0 end) as missing_performnacesalaryhike
FROM hr_analysis;


-- #overall Attrition rate
select attrition,count(*) as count
from hr_analysis
group by Attrition;


-- Attrition Rate Percentage by Status (Yes/No)
SELECT 
  Attrition,
  COUNT(*) AS total_employees,
  ROUND(COUNT(attrition) * 100.0 / (SELECT COUNT(*) FROM hr_analysis), 2) AS percentage
FROM hr_analysis
GROUP BY Attrition;


-- Department-wise Attrition Count and Rate
SELECT 
  Department,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
  COUNT(*) AS total,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_analysis
GROUP BY Department;


-- #count of employees by department
SELECT Department, COUNT(*) AS total_employees
FROM hr_analysis
GROUP BY Department;


-- #count of employees by department
SELECT Department, COUNT(*) AS total_employees
FROM hr_analysis
GROUP BY Department;


-- #Job satisfaction by employee count
select jobsatisfaction,count(*) as total_employees
from hr_analysis
group by JobSatisfaction


-- #Gender based attrition analysis
select gender,attrition,count(*) as total_employees
from hr_analysis
group by gender,Attrition;


-- #categorizing age
SELECT
  CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 55 THEN '46-55'
    ELSE '56+' 
  END AS AgeGroup,
  COUNT(*) AS total_employees
FROM hr_analysis
GROUP BY AgeGroup
ORDER BY total_employees DESC;


-- Attrition Rate by Age Group
SELECT 
  CASE 
    WHEN Age < 25 THEN 'Under 25'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    ELSE '55+' 
  END AS age_group,
  COUNT(*) AS total_employees,
  SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS attrited,
  ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM hr_analysis
GROUP BY age_group
ORDER BY age_group;
