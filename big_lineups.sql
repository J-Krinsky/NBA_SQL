#A query to identify lineups with two big men and do a rough comparison to lineups with only one

#Internal query combines the results of five queries using UNION ALL
#Each indivudual query checks joins the lineups and players table on one column of the id_index table to check if that player is a big (PF or C)
#The UNION ALL adds a row for each player in each lineup passing the percentage test. 
#In the middle query, we combine GROUP BY on lineups.id and COUNT to produce a new column counting the number of bigs in each lineup. 
#It also pulls net_rating, rebound percentage, and pace information for each lineup
#The outer query uses GROUP BY on the number of big men to get a rough aggregate of the performance of each type of lineup

SELECT bigs, AVG(net_rating), AVG(REB), AVG(pace) FROM (
SELECT u.id, COUNT(u.id) AS bigs, names, net_rating, REB, pace FROM
(
SELECT lineups.id, names, net_rating, REB, pace
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_one
WHERE pos = 'PF'
    OR pos = 'C'
    UNION ALL
SELECT lineups.id, names, net_rating, REB, pace
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_two
WHERE pos = 'PF'
    OR pos = 'C'
    UNION ALL
SELECT lineups.id, names, net_rating, REB, pace
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_three
WHERE pos = 'PF'
    OR pos = 'C'
    UNION ALL
SELECT lineups.id, names, net_rating, REB, pace
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_four
WHERE pos = 'PF'
    OR pos = 'C'
    UNION ALL
SELECT lineups.id, names, net_rating, REB, pace
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_five
WHERE pos = 'PF'
    OR pos = 'C'
)
AS u
GROUP BY u.id
)AS super
GROUP BY bigs
;
