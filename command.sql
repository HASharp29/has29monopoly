-- a
SELECT *
FROM Game
ORDER BY time

-- b
SELECT *
FROM Game
WHERE time >= NOW() - INTERVAL '7 days';

-- c
SELECT *
FROM Player
WHERE name IS NOT NULL

-- d
SELECT DISTINCT playerID
FROM PlayerGame
WHERE score > 2000d

-- e
SELECT * 
FROM Player
WHERE emailAddress LIKE '%@gmail%'


-- a
SELECT score
FROM Player, PlayerGame
WHERE Player.name = 'The King'
and Player.ID = PlayerGame.playerID
ORDER BY score

-- b
SELECT p.name, score
FROM Player p, PlayerGame pg
WHERE p.ID= pg.playerID
and pg.score = (
   SELECT MAX(score)
   FROM Game g , PlayerGame pg
   WHERE g.time =  '2006-06-28 13:20:00'
   and g.ID = pg.gameID
)

--c
-- the statement P1.ID < P2.ID ensures that each distinct pair of players is called only once, and that a player is not paired with themselves

--d
--If you wanted to ensure that there were no duplicate entries in a table, you could join a table with itself, search for matching pairs, and then delete one of them. 