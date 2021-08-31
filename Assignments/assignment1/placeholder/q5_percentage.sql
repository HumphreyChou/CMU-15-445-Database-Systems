WITH premiered_list(decade, cnt) AS (
    SELECT CAST(premiered / 10 * 10 AS TEXT) || 's' AS decade, COUNT(*) AS cnt
    FROM titles
    WHERE premiered IS NOT NULL 
    GROUP BY decade
),
total(cnt) AS (
    SELECT COUNT(*) FROM titles
)
SELECT premiered_list.decade, ROUND(CAST(premiered_list.cnt AS REAL) / total.cnt * 100.0, 4) AS percent
FROM premiered_list, total
ORDER BY percent DESC;