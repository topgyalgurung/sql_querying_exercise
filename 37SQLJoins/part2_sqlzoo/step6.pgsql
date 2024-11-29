-- game: id, mdate, stadium, team1, team2
-- goal: matchid, teamid, player, gtime
-- eteam: id, teamname, coach

-- game
-- id	  mdate	        stadium	                team1	team2
-- 1001	8 June 2012	  National Stadium, Warsaw	POL	GRE

-- goal
-- matchid	teamid	player	              gtime
-- 1001	    POL	    Robert Lewandowski	  17

-- eteam
-- id	teamname	coach
-- POL	Poland	Franciszek Smuda

SELECT eteam.teamname, COUNT(goal.matchid) 
FROM eteam
JOIN goal ON eteam.id = goal.teamid

SELECT goal.player
FROM goal
JOIN game ON goal.matchid = game.id 
WHERE goal.team2 = 'GER' AND game.teamid ! = 'GER') OR
WHERE goal.team1 = 'GER' AND game.team!='GER'

SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';

-- 2. Show id, stadium, team1, team2 for just game 1012
SELECT id, stadium, team1, team2 
FROM game
WHERE id = 1012;

--3. Modify it to show the player, teamid, stadium and mdate for every German goal.
SELECT goal.player, goal.teamid, game.stadium, game.mdate
  FROM game JOIN goal ON (id=matchid) 
  WHERE goal.teamid ='GRE';

-- 4. Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%
SELECT ga.team1, ga.team2, go.player 
FROM game ga
JOIN goal go ON(ga.id = go.matchid)
WHERE go.player LIKE 'Mario%';

--5. Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10
SELECT goal.player, goal.teamid, eteam.coach, goal.gtime,
FROM goal JOIN eteam on teamid=id
WHERE gtime<=10;

--6. List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.
SELECT ga.mdate, eteam.teamname
FROM game ga JOIN eteam e ON (team1=e.id)
WHERE e.coach = 'Fernando Santos';

--7. List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
SELECT go.player, ga.stadium
FROM goal go
JOIN game ga
ON go.matchid = ga.id
WHERE ga.stadium = 'National Stadium, Warsaw'

-- more difficult questions 
-- 8. Instead show the name of all players who scored a goal against Germany.
SELECT 
  DISTINCT goal.player
FROM goal
JOIN game ON goal.matchid = game.id
WHERE (game.team1 = 'GER' OR goal.team2 = 'GER') AND (goal.teamid != 'GER');

-- 9. Show teamname and the total number of goals scored.
