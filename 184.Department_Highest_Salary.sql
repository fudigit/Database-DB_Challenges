/* Write your T-SQL query statement below */

-- get the max salary for each department
-- and join on both max_salary and department to handle multiple max salaries
WITH Dep_max_salary AS(
    SELECT DepartmentId, MAX(Salary) AS Max_salary
    FROM
        Employee
    GROUP BY
        DepartmentId 
    )


SELECT 
    Department.Name AS 'Department',
    Employee.Name AS 'Employee',
    Employee.Salary
FROM
    Employee, Dep_max_salary, Department
WHERE
    Employee.Salary = Dep_max_salary.Max_salary
    AND Employee.DepartmentId = Dep_max_salary.DepartmentId
    AND Employee.DepartmentId = Department.Id

