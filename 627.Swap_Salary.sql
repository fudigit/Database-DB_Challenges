/* Write your T-SQL query statement below */

-- Searched CASE expression: 
UPDATE salary
SET sex =
    (CASE
        WHEN sex = 'm' THEN 'f'
        WHEN sex = 'f' THEN 'm'
     END
    )
    

-- Searched CASE expression: 
--UPDATE salary  
-- SET sex =
--     (CASE sex
--         WHEN 'm' THEN 'f'
--         WHEN 'f' THEN 'm'
--      END
--     )


-- CASE  
--          WHEN SalariedFlag = 0 THEN VacationHours + @NewHours  
--          ELSE @NewHours  
--        END
