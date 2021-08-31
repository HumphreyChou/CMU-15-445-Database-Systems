WITH title_list(title_id, cnt) AS (
    SELECT title_id, COUNT(*) AS cnt FROM akas
    GROUP BY title_id
)
SELECT titles.primary_title, title_list.cnt 
FROM titles JOIN title_list ON titles.title_id == title_list.title_id
ORDER BY title_list.cnt DESC
LIMIT 10;