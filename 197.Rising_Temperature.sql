/* Write your T-SQL query statement below */

SELECT
    Weather_1.Id AS "Id"
FROM
    Weather AS Weather_1
LEFT JOIN
    Weather AS Weather_2
    ON DATEADD(day, -1, Weather_1.RecordDate) = Weather_2.RecordDate
WHERE
    Weather_1.Temperature > Weather_2.Temperature

-- for each RecordDate, Join the Temprature of the previous dates 
-- DATEADD (datepart , number , date)  
-- https://docs.microsoft.com/en-us/sql/t-sql/functions/dateadd-transact-sql?view=sql-server-ver15
