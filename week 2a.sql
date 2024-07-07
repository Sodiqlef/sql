SELECT * FROM student.attrition_table 
	ORDER BY age ASC, YearsAtCompany ASC;
    
    
SELECT * FROM student.attrition_table 
	ORDER BY Department ASC, JobRole ASC ;
    
    
SELECT * FROM student.attrition_table 
	ORDER BY NumCompaniesWorked ASC, age ASC ;
    
    
SELECT * FROM student.attrition_table 
	ORDER BY EducationField ASC, gender ASC ;
    
    
SELECT * FROM student.attrition_table 
	ORDER BY age DESC, YearsAtCompany DESC ;
    
SELECT * FROM student.attrition_table 
	ORDER BY Department DESC, JobRole DESC ;
    
    
SELECT * FROM student.attrition_table 
	ORDER BY NumCompaniesWorked DESC, age DESC ;
    
    
-- !!! 1.	Calculate the number of years at the company for all employees.
SELECT SUM(Yearsatcompany) fROM attrition_table;

--- ### 2.	Find the total sum of ages for employees with the attrition status (yes).
SELECT SUM(age) FROM attrition_table 
	WHERE Attrition = 'yes';
    
-- $$$ 3.	Calculate the sum of years at the company for employees in life sciences.
SELECT SUM(YearsAtCompany) FROM attrition_table
	WHERE EducationField = 'life sciences';
    
-- *** 1.	Calculate the average age of employees in each department.
SELECT department, AVG(age) FROM attrition_table
	GROUP BY department;
    
-- !!! 2.	Find the average number of years at the company for employees with the attrition status (yes).
SELECT AVG(YearsAtCompany) FROM attrition_table
	WHERE Attrition = 'yes';


-- !!! 3.	Calculate the average age of employees in the research and development department.

SELECT AVG(age) FROM attrition_table
	WHERE Department = 'research & development';
    
    
-- %%% 5.	Find the average number of companies worked at by employees in each job role.
SELECT jobRole, avg(NumCompaniesWorked) FROM attrition_table
	GROUP BY JobRole;
    
    
SELECT  distinct department, COUNT(department) FROM attrition_table
	GROUP BY department;
    
    
-- !!! 2.	Find the count of attritions for employees with attrition status (yes) in each education field.
SELECT count(attrition) FROM attrition_table
	where attrition = 'yes';
    
    SELECT jobRole, count(attrition) FROM attrition_table
	where attrition = 'yes'
    GROUP BY JobRole;
    
    
-- *** 1.	Find the minimum age among all employees.
SELECT min(age) FROM attrition_table;

-- *** 4.	Find the minimum number of companies worked at by research scientists.
SELECT min(numCompaniesWorked) FROM attrition_table
	where jobRole = 'Research Scientist';
    
-- *** 1.	Find the maximum age among all employees.
SELECT MAX(age) FROM attrition_table;


-- *** 5.	Find the maximum age of employees who have attrition status (no) and are married.
SELECT MAX(age) FROM attrition_table 
	where attrition = "no" and MaritalStatus = 'Married';


