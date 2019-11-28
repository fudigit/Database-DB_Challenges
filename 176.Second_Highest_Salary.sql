/* Write your T-SQL query statement below */

WITH Result AS
    (
    SELECT
        DISTINCT(Salary) AS "SecondHighestSalary"
    FROM Employee
    ORDER BY Salary DESC         --Order by happens after SELECT!
        OFFSET 1 ROWS
        FETCH NEXT 1 ROWS ONLY
    )

SELECT
    MAX(SecondHighestSalary) AS "SecondHighestSalary"
FROM Result

 -- Order by happens after SELECT! In T-SQL, 'ORDER BY col ASC' implies nulls first!
 -- MAX ignores any null values, returns NULL when there is no row to select
 -- DISTINCT get rid of the dups
 -- Usage of OFFSET(rows to skip) and FETCH(numer of rows to return after OFFSET)
 -- Usage of WITH common_table_expression, specifies a temp result set
 -- Aggregation function and value cannot be selected at the same time
