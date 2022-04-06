/*#Find all lineups with Jayson Tatum using 1 join
SELECT names FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
WHERE 
(SELECT ID FROM players
 WHERE name = 'Jayson Tatum'
 )
 IN (player_id_one, player_id_two, player_id_three, player_id_four, player_id_five);
 */
 
/*#Find all lineups with Jayson Tatum using 2 joins
SELECT lineups.names FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_one
OR players.id = id_index.player_id_two
OR players.id = id_index.player_id_three
OR players.id = id_index.player_id_four
OR players.id = id_index.player_id_five
WHERE players.name = 'Jayson Tatum';*/

/*#Find lineups with Jayson Tatum, but without Jaylen Brown using 1 joins
SELECT names FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
WHERE 
(SELECT ID FROM players
 WHERE name = 'Jayson Tatum'
 )
 IN (player_id_one, player_id_two, player_id_three, player_id_four, player_id_five)
 AND
(SELECT ID FROM players
WHERE name = 'Jaylen Brown')
NOT IN (player_id_one, player_id_two, player_id_three, player_id_four, player_id_five);
*/

/*
#Find lineups with Jayson Tatum, but not Jaylen Brown using 6!!! joins SELECT names
SELECT names
FROM players as p_one
INNER JOIN id_index
ON p_one.id = id_index.player_id_one
INNER JOIN players as p_two
ON p_two.id = id_index.player_id_two
INNER JOIN players as p_three
ON p_three.id = id_index.player_id_three
INNER JOIN players as p_four
ON p_four.id = id_index.player_id_four
INNER JOIN players as p_five
ON p_five.id = id_index.player_id_five
INNER JOIN lineups
ON lineups.id = id_index.lineup_id
WHERE 'Jayson Tatum'
IN (p_one.name, p_two.name, p_three.name, p_four.name, p_five.name)
AND 'Jaylen Brown'
NOT IN (p_one.name, p_two.name, p_three.name, p_four.name, p_five.name)
;
*/

#Find lineups with Top 4 using LIKE and wild cards
SELECT id, names, net_rating, minutes, off_rating, def_rating
FROM lineups
WHERE names LIKE '%Tatum%' 
AND names LIKE '%Brown%'
AND names LIKE '%Williams I%'
AND names LIKE '%Smart%'
;
