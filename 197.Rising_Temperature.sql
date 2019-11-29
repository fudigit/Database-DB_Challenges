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


-- DATEADD (datepart , number , date )  
