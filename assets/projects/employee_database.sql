USE [employee_database]
GO

SELECT [Empid]
      ,[Fullname]
      ,[ManagerID]
      ,[DataOfJoing]
      ,[City]
  FROM [dbo].[Employee_Details]

GO

----1	Write an SQL query to fetch the EmpId and FullName of all the employees 
--working under the Manager with id � �986�.

SELECT
		EmpID,
		Fullname
FROM Employee_Details
WHERE ManagerID = '986';

----2	Write an SQL query to fetch the different projects available from the 
--EmployeeSalary table.

SELECT Project
FROM Employee_Salary;

----3	Write an SQL query to fetch the count of employees working in project �P1�.

SELECT
		COUNT(Empid)
FROM Employee_Salary
WHERE Project = 'P1';

----4	Write an SQL query to find the maximum, minimum, and average salary of the 
--employees.

SELECT 
		MAX(Salary) AS Maximum_Salary,
		MIN(Salary)	AS Minimum_Salary,
		AVG(Salary) AS Average_Salary
FROM Employee_Salary;

----5	Write an SQL query to find the employee id whose salary lies in the range of 
--9000 and 15000.

SELECT	EmpId
FROM	Employee_Salary
WHERE Salary BETWEEN 9000 AND 15000

--if need to show with names

SELECT	es.EmpId,
		ed.fullname
FROM Employee_Salary AS es
LEFT JOIN Employee_Details AS ed
ON es.Empid = ed.Empid
WHERE Salary BETWEEN 9000 AND 15000;

----6	Write an SQL query to fetch those employees who live in Toronto and work under 
--the manager with ManagerId � 321.

SELECT	*
FROM	Employee_Details
WHERE	City = 'Toronto' AND ManagerID = '321';

----7	Write an SQL query to�fetch all the employees who either live in California 
--or work under a manager with ManagerId � 321.

SELECT	*
FROM Employee_Details
WHERE City = 'California' OR ManagerID = '321';

----8	Write an SQL query to fetch all those employees who work on Projects other 
--than P1.

SELECT	ed.Empid,
		ed.Fullname,
		es.Project
FROM	Employee_Details AS ed
FULL JOIN Employee_Salary AS es 
ON ed.Empid = es.EmpId
WHERE Project NOT IN ('P1');

----9	Write an SQL query to display the total salary of each employee adding the 
--Salary with Variable value.

SELECT	es.EmpId,
		ed.Fullname,
		SUM(Salary + Variable) AS Total_Salary
FROM Employee_Salary AS es
LEFT JOIN Employee_Details AS ed
ON es.Empid = ed.Empid
GROUP BY es.Empid, ed.Fullname;

----10	Write an SQL query to fetch the employees whose name begins with any two 
--characters, followed by a text �hn� and ends with any sequence of characters.

SELECT *
FROM Employee_Details
WHERE Fullname like '__hn%';

----11	Write an SQL query to fetch all the EmpIds which are present in either of 
--the tables � �EmployeeDetails� and �EmployeeSalary�.

SELECT ed.EmpId
FROM Employee_Details AS ed
FULL JOIN Employee_Salary AS es
ON ed.Empid = es.Empid;

--- if names and salaries are needed

SELECT	ed.EmpId,
		ed.fullname,
		es.Salary
FROM Employee_Details AS ed
FULL JOIN Employee_Salary AS es
ON ed.Empid = es.Empid;
