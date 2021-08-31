WITH types(type, runtime_minutes) AS (
    SELECT type, MAX(runtime_minutes) FROM titles
    GROUP BY type
)
SELECT titles.type, titles.primary_title, titles.runtime_minutes
    FROM titles, types
    WHERE titles.type == types.type AND titles.runtime_minutes == types.runtime_minutes
    ORDER BY titles.type ASC, titles.primary_title ASC;