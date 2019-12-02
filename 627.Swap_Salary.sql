/* Write your T-SQL query statement below */

--v1
-- Searched CASE expression: 
UPDATE salary
SET sex =
    (CASE
        WHEN sex = 'm' THEN 'f'
        WHEN sex = 'f' THEN 'm'
     END
    )
    
--v2
-- Searched CASE expression: 
UPDATE salary  
SET sex =
    (CASE sex
        WHEN 'm' THEN 'f'
        WHEN 'f' THEN 'm'
     END
    )

--        CASE  
--          WHEN SalariedFlag = 0 THEN VacationHours + @NewHours  
--          ELSE @NewHours  
--        END

-- Demo of UPDATE, with SET(columns to update = new values), WHERE(filter the rows to update)
IF NOT EXISTs(
	SELECT name
	FROM sys.databases
	WHERE name = 'TutorialDB'
	)
CREATE DATABASE [TutorialDB]
GO

USE TutorialDB
-- drop table if aleady exists
IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
DROP TABLE dbo.Customers
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Customers
(
	CustomerId INT NOT NULL PRIMARY KEY,
	Name [NVARCHAR](50) NOT NULL,
	Location	[NVARCHAR](50)	NOT	NULL,
	Email	[NVARCHAR](50)	NOT	NULL
)
GO
-- Insert values
INSERT INTO dbo.Customers
   ([CustomerId],[Name],[Location],[Email])
VALUES
   ( 1, N'Orlando', N'Australia', N'abc@gmai.com'),
   ( 2, N'Keith', N'India', N'keith0@adventure-works.com'),
   ( 3, N'Donna', N'Germany', N'donna0@adventure-works.com'),
   ( 4, N'Janet', N'United States', N'janet1@adventure-works.com')
GO

SELECT * FROM dbo.Customers;
GO

UPDATE Customers
SET Location = 'China', Email = 'Erased'
WHERE Name = 'Keith'

SELECT * FROM dbo.Customers;
GO
