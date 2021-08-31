SELECT CAST(premiered / 10 * 10 AS TEXT) || 's' AS decade, COUNT(*) as cnt
FROM titles
WHERE premiered is NOT NULL
GROUP BY decade
ORDER BY cnt DESC;