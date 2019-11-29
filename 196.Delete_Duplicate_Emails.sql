# Write your MySQL query statement below
  
DELETE P1 FROM Person AS P1
WHERE
    P1.Id NOT IN(
        SELECT *
        FROM(
            SELECT
                MIN(Id) AS smallest_id
            FROM
                Person AS P2
            GROUP BY
                Email
            ) AS Tmp_T1
        )

# DELETE, If you declare an alias for a table, you must use the alias when referring to the table
# You cannot update a table and select directly from the same table in a subquery. SELECT * FROM(subquery) does the trick!
# https://dev.mysql.com/doc/refman/5.5/en/delete.html
