
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
