SELECT *
FROM cinema
WHERE
    id % 2 = 1 and description != 'boring'
ORDER BY rating DESC

-- MOD in SQL: %
