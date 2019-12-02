-- v1, join on Ids that are distanced by 1, and check if Num are the same. Do it 2 times, works for 3 consecutive nums
SELECT
    DISTINCT(L1.Num) AS 'ConsecutiveNums'
FROM
    Logs AS L1
LEFT JOIN Logs AS L2
    ON L1.Id + 1 = L2.Id
LEFT JOIN Logs AS L3
    ON L2.Id + 1 = L3.ID
WHERE
    L1.Num = L2.Num AND L2.Num = L3.Num
