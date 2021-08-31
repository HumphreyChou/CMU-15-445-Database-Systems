WITH w_ave_rating(val) AS (
    SELECT SUM(rating * votes) / SUM(votes)
    FROM ratings JOIN titles ON titles.title_id == ratings.title_id
    AND titles.type == 'movie'
)
SELECT primary_title, (votes / (votes + 25000.0)) * rating + (25000.0 / (votes + 25000.0)) * val AS wr
FROM titles, w_ave_rating 
JOIN ratings ON titles.title_id == ratings.title_id 
AND titles.type == 'movie'
ORDER BY wr DESC
LIMIT 250;