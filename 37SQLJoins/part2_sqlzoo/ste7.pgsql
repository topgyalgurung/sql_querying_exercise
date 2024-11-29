-- tables: movie, actor, casting

-- movie
-- id	title	yr	director	budget	gross
-- 10003	"Crocodile" Dundee II	1988	38	15800000	239606210

-- actor
-- id	name
-- 20	Paul Hogan

-- casting
-- movieid	actorid	ord
-- 10003	20	4

--1 List the films where the yr is 1962 [Show id, title]
SELECT id, title
 FROM movie
 WHERE yr=1962;

-- 2	When was Citizen Kane released?
SELECT name
FROM actor
WHERE name = 'Citizen Kane';

-- 3	Star Trek movies
SELECT id, title, yr 
FROM movie WHERE title like '%Star Trek%'
ORDER BY yr

-- 4	id for actor Glenn Close
SELECT id, name
FROM actor
WHERE actor ='Glen Close';

-- 5	id for Casablanca
SELECT id, title
FROM movie
WHERE title = 'Casablanca';

-- 6	Cast list for Casablanca
SELECT m.title, a.name
FROM movie m
JOIN casting c ON m.id = c.movieid
JOIN actor a ON a.id = c.actorid
WHERE movie.title = 'Casablanca';

-- 7	Alien cast list
SELECT m.title, a.name
FROM movie m
JOIN casting c ON m.id = c.movieid
JOIN actor a ON a.id = c.actorid
WHERE movie.title = 'Alien';

-- 8	Harrison Ford movies
SELECT m.title
FROM movie m
JOIN casting c ON m.id = c.movieid
JOIN actor a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford';

-- 9	Harrison Ford as a supporting actor
SELECT m.title
FROM movie m
JOIN casting c ON m.id = c.movieid
JOIN actor a ON a.id = c.actorid
WHERE a.name = 'Harrison Ford' AND c.ord !=1;

-- 10	Lead actors in 1962 movies
SELECT m.title, a.name
FROM movie m 
JOIN casting c ON m.id = c.movieid
JOIN actor a ON a.id = c.actorid
WHERE m.yr = 1962 AND c.ord = 1;

-- HARDER QUESTIONS -- 

-- 11	Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12	Lead actor in Julie Andrews movies
SELECT title, name
FROM movie JOIN casting ON (movieid = movie.id AND ord = 1)
            JOIN actor ON (actorid = actor. id)
WHERE movie.id IN (
    SELECT movieid FROM casting 
    WHERE actorid IN (
        SELECT id FROM actor 
        WHERE name ='Julie Andrews'
    )
)
-- 13	Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.
SELECT actor.name, COUNT(casting.movieid) AS starring_roles
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.ord = 1
GROUP BY actor.name
HAVING COUNT(casting.movieid) >= 15
ORDER BY actor.name;

-- 14	List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
SELECT movie.title, COUNT(casting.actorid) AS num_actors
FROM movie
JOIN casting ON movie.id = casting.movieid
WHERE movie.yr = 1978
GROUP BY movie.title
ORDER BY num_actors DESC, movie.title;