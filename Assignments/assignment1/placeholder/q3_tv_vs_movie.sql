SELECT type, COUNT(primary_title) as cnt
FROM titles 
GROUP BY type
ORDER BY cnt ASC;