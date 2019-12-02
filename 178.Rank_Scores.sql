-- V1
-- Use DENSE_RANK() directly, The Syntax includes DENSE_RANK() OVER([ <partition_by_clause> ] < order_by_clause > )
SELECT
	Score,
	DENSE_RANK() OVER(ORDER BY Score DESC) AS Rank
FROM Scores;
GO


-- V2
-- Count number of unique scores that's greater or equal than the current score
-- Subquery in select will excute for each row of the main query
SELECT
    score,
    (SELECT
        COUNT(DISTINCT(S_sub.Score))
     FROM
        Scores AS S_sub
     WHERE
        S_sub.Score >= S_main.Score 
    ) AS Rank
FROM Scores AS S_main
ORDER BY Rank


-- V3
-- use ROW_NUMBER() to get the ranking for the unique scores
-- then join with the main table to get the rank for each score (duplicated scores have the same ranking)
;WITH Unique_score_rank
AS (
	SELECT
		ROW_NUMBER() OVER (ORDER BY Unique_score DESC) AS Score_Rank,
		Unique_score
	FROM(
		SELECT
			DISTINCT(Score) AS Unique_score
		FROM 
			Scores
		) AS Uni_Scores_T
	)

SELECT Scores.Score, Unique_score_rank.Score_Rank AS Rank
FROM Scores
LEFT JOIN Unique_score_rank
	ON Scores.Score = Unique_score_rank.Unique_score
ORDER BY Score DESC
-- Alias is always required in T-SQL
	      
	      
	      
-- V4     
-- Leetcode does not support CREATE VIEW!
-- This is to DEMO the DROP VIEW, CREATE VIEW, and query the VIEW
IF OBJECT_ID('View_table') IS NOT NULL
DROP VIEW View_table
GO

CREATE VIEW View_table
AS
SELECT
	ROW_NUMBER() OVER (ORDER BY Unique_score DESC) AS Score_Rank,
	Unique_score
FROM(
	SELECT
		DISTINCT(Score) AS Unique_score
	FROM 
		Scores
	) AS Uni_Scores_T
GO

SELECT Scores.Score, View_table.Score_Rank AS Rank
FROM Scores
LEFT JOIN View_table
	ON Scores.Score = View_table.Unique_score
ORDER BY Score DESC
