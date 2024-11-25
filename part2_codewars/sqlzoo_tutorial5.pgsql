-- SUM AND COUNT 
-- Aggregate functions 
-- name	 continent	area	population	gdp

-- 1. 
SELECT SUM(population)
FROM world
--2.
SELECT DISTINCT continent
FROM world
-- 3. 
SELECT SUM(gdp)
FROM world 
WHERE continent = 'Africa'
-- 4. 
SELECT COUNT(*) 
FROM world
WHERE area >= 1000000
-- 5. 
SELECT SUM(population)
FROM world
WHERE name in ('Estonia', 'Latvia', 'Lithuania')
-- 6.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

--7. For each continent show the continent and number of countries with populations of at least 10 million.
SELECT continent, count(name)
FROM world
WHERE population >= 10000000
GROUP BY continent 

-- 8. List the continents that have a total population of at least 100 million
SELECT continent
FROM world
GROUP BY continent
Having sum(population) >=100000000