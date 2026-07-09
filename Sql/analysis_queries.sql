=======================
DATA VALIDATION QUERIES
=======================
-- Total Records Check
SELECT COUNT(*) AS Total_Records
FROM employees;

-- Duplicate Employee Numbers Check
SELECT EmployeeNumber, COUNT(*)
FROM employees
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Missing Values Check
SELECT *
FROM employees
WHERE EmployeeNumber IS NULL
   OR Department IS NULL
   OR MonthlyIncome IS NULL;

-- Check Attrition Values
SELECT DISTINCT Attrition
FROM employees;

=======================
DATA CLEANING QUERIES
=======================
-- Verify No Duplicate Employee Numbers
SELECT EmployeeNumber, COUNT(*)
FROM employees
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Verify No Missing Values
SELECT *
FROM employees
WHERE EmployeeNumber IS NULL
   OR Department IS NULL
   OR MonthlyIncome IS NULL;

   =======================
   KPI QUERIES
   =======================
   -- Total Employees
SELECT COUNT(*) AS Total_Employees
FROM employees;

-- Attrition Count
SELECT COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition = 'Yes';

-- Attrition Rate
SELECT ROUND(
       (SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)
       / COUNT(*)) * 100,2
       ) AS Attrition_Rate
FROM employees;

-- Average Salary
SELECT ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM employees;

-- Average Years at Company
SELECT ROUND(AVG(YearsAtCompany),2) AS Avg_Years
FROM employees;

==========================
BUSINESS ANALYSIS QUERIES
==========================
-- Attrition by Department
SELECT Department,
       COUNT(*) AS Employees_Left
FROM employees
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY Employees_Left DESC;

-- Attrition by Age
SELECT Age,
       COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY Age
ORDER BY Attrition_Count DESC;

-- Overtime Impact on Attrition
SELECT OverTime,
       COUNT(*) AS Attrition_Count
FROM employees
WHERE Attrition='Yes'
GROUP BY OverTime;