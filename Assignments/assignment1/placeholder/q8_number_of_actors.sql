WITH works(title_id) AS (
    SELECT DISTINCT crew.title_id 
    FROM people JOIN crew ON people.person_id == crew.person_id
    AND people.name == 'Mark Hamill' AND people.born == 1951
)
SELECT COUNT(DISTINCT(crew.person_id)) 
FROM works JOIN crew ON works.title_id == crew.title_id
AND (crew.category == 'actor' OR crew.category == 'actress');