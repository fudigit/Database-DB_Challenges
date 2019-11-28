SELECT
    T_Employee.Name AS "Employee"
FROM 
    Employee AS T_Employee
LEFT JOIN 
    Employee AS T_Manager 
    ON T_Employee.ManagerId = T_Manager.Id
WHERE 
    T_Employee.Salary > T_Manager.Salary
