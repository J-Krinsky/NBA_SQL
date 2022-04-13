#Find overall ratings of indivdual players across lineups. 
#Ratings are calculated on a per 100 posessions basis, so I use pace, which is possesions per 48 minutes, and minutes to find totals, and then recalculate based on the totals
#Triple join all tables, group by player ID
SELECT name,
#Get players Net, offensive defensive ratings based on grouping
SUM(net)/SUM(poss)*100 as n_rating, SUM(pts)/SUM(poss)*100 AS o_rating, SUM(def)/SUM(poss)*100 AS d_rating
FROM
#Use subquery to add total points, defense, net rating and possesions
(
    SELECT players.name, players.id AS player_id,
off_rating*pace*lineups.minutes/4800 AS pts, 
def_rating*pace*lineups.minutes/4800 AS def, 
net_rating*pace*lineups.minutes/4800 AS net, 
pace*lineups.minutes/48 AS poss
FROM lineups
JOIN id_index
ON lineups.id = id_index.lineup_id
JOIN players
ON players.id = id_index.player_id_one
OR players.id = id_index.player_id_two
OR players.id = id_index.player_id_three
OR players.id = id_index.player_id_four
OR players.id = id_index.player_id_five
) as whop
GROUP BY player_id
ORDER BY n_rating DESC
;
