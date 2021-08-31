WITH 
hamill_works(title_id) AS (
    SELECT DISTINCT crew.title_id 
    FROM people JOIN crew ON people.person_id == crew.person_id
    AND people.name == 'Mark Hamill' AND people.born == 1951
),
both_works(title_id) AS (
    SELECT DISTINCT crew.title_id
    FROM people JOIN crew ON people.person_id == crew.person_id
    AND people.name == 'George Lucas' AND people.born == 1944
    AND crew.title_id IN hamill_works
)
SELECT titles.primary_title
FROM titles JOIN both_works ON titles.title_id == both_works.title_id
AND titles.type == 'movie'
ORDER BY titles.primary_title ASC;