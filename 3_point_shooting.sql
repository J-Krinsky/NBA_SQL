#Two queries to identify the number of strong three point shooters in each lineup, defined here as having a three point percentage at or above thirty five percent, which is leage average. 

#Internal query combines the results of five queries using UNION ALL
#Each indivudual query checks joins the lineups and players table on one column of the id_index table to check if that player is a stong shooter
#The UNION ALL adds a row for each player in each lineup passing the percentage test. 
#In the outer query, we combine GROUP BY on lineups.id and COUNT to produce a new column counting the number of above average shooters in each lineup. 
#We also query the offensive rating, assist percentage, and total minutes played of each lineup
Select names, off_rating, assist_p, count(u.id) AS shooters, minutes FROM
(
#Query the first lineup column
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_one
WHERE IFNULL(3pm/3pa, 0) > .35
    UNION ALL
#Query the second lineup column
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_two
WHERE IFNULL(3pm/3pa, 0) > .35
    UNION ALL
#Query the third lineup column
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_three
WHERE IFNULL(3pm/3pa, 0) > .35
    UNION ALL
#Query the fourth lineup column
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_four
WHERE IFNULL(3pm/3pa, 0) > .35
    UNION ALL
#Query the fifth lineup position
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_five
WHERE IFNULL(3pm/3pa, 0) > .35
) as u
GROUP BY u.id
ORDER BY off_rating DESC
;

#Inner query joins all three lineups, creating a table where each combination of a lineup and the five players in it is represented
#That list is filtered, leaving only the rows containing a strong shooter
#In the outer query, we combine GROUP BY on lineups.id and COUNT to produce a new column counting the number of above average shooters in each lineup. 
#We also query the offensive rating, assist percentage, and total minutes played of each lineup
Select names, off_rating, assist_p, count(u.id), minutes FROM
(
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_one
OR players.id = id_index.player_id_two
OR players.id = id_index.player_id_three
OR players.id = id_index.player_id_four
OR players.id = id_index.player_id_five
WHERE IFNULL(3pm/3pa, 0) > .35
) as u
GROUP BY u.id
ORDER BY off_rating DESC
;
