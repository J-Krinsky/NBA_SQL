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
