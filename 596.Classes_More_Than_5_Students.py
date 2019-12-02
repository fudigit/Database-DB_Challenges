/* Write your T-SQL query statement below */

SELECT class
FROM
    courses
GROUP BY
    class
HAVING COUNT(DISTINCT(student)) >= 5


-- There are duplicated student name for each class
-- Use of COUNT after DISTINCT
-- aggregate function do calculation on a set of values, ignores null
