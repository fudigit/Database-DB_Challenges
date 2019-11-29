
SELECT class
FROM
    courses
GROUP BY
    class
HAVING COUNT(DISTINCT(student)) >= 5


-- There are duplicated student name for each class
