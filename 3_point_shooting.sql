Select names, off_rating, assist_p, count(u.id), minutes FROM
(
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_one
WHERE IFNULL(3pm/3pa, 0) > .35
    UNION ALL
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_two
WHERE IFNULL(3pm/3pa, 0) > .35
    UNION ALL
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_three
WHERE IFNULL(3pm/3pa, 0) > .35
    UNION ALL
SELECT lineups.id, names, off_rating, assist_p, lineups.minutes
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_four
WHERE IFNULL(3pm/3pa, 0) > .35
    UNION ALL
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
