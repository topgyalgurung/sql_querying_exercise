--Simple WHERE and ORDER BY
SELECT * 
FROM people 
WHERE age > 50
ORDER BY age DESC;

--- Simple SUM
select sum(age) as age_sum
FROM people;

-- Simple MIN / MAX
SELECT MIN(age) AS age_min, MAX(age) AS age_max
FROM people;

--  Find all active students
SELECT FirstName, LastName 
FROM students
WHERE isActive = 1

-- For this challenge you need to create a simple GROUP BY statement, you want to group all the people by their age and count the people who have the same age.
SELECT age, count(*) as people_count
FROM people
GROUP BY age 

-- For this challenge you need to create a simple HAVING statement, you want to count how many people have the same age and return the groups with 10 or more people who have that age.
SELECT age, COUNT(*) AS total_people
FROM people
GROUP BY age
HAVING count(*) >=10;