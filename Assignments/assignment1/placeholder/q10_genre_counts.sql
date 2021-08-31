WITH RECURSIVE split(genre, rest) AS (
    SELECT '', genres || ',' FROM titles WHERE genres != "\N"
    UNION ALL
    SELECT substr(rest, 0, instr(rest, ',')),
        substr(rest, instr(rest, ',') + 1)
    FROM split
    WHERE rest != ''
) 
SELECT genre, COUNT(*) AS cnt FROM split 
WHERE genre != ''
GROUP BY genre
ORDER BY cnt DESC;