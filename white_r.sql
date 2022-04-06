#Compare accumulated net/offensive/defensive ratings for lineups with Derrick White and Josh Richardson - who were traded for each other. 
#Rating is calculated as points per 100 possesions, and pace is possesions per 48 minutes, which allows us to find points and possesions
SELECT whop as name, SUM(net)/SUM(poss)*100 as n_rating, SUM(pts)/SUM(poss)*100 AS o_rating, SUM(def)/SUM(poss)*100 AS d_rating
FROM  (
#Use a subquery to add column w/total points scored, points allowed, net, and possesions to each lineup
    SELECT *, 
    off_rating*pace*minutes/4800 AS pts, 
    def_rating*pace*minutes/4800 AS def, 
    net_rating*pace*minutes/4800 AS net, 
    pace*minutes/48 AS poss,
#Use case statements to identify which lineups have White, and which have Richardson    
    CASE 
    WHEN names LIKE '%White%' THEN 'White'
    WHEN names LIKE '%Richardson%' THEN 'Richardson'
    ELSE 'Neither'
    END AS whop
    FROM lineups
    ) AS cases
    #Exclude all lineups with neither player
    WHERE whop NOT LIKE 'Neither'
    #Group on the result of the case statement
    GROUP BY whop
    ;


#Compare accumulated net/offensive/defensive ratings for lineups with Derrick White and Josh Richardson, but not Dennis Schroder - who were traded for each other. 
#Rating is calculated as points per 100 possesions, and pace is possesions per 48 minutes, which allows us to find points and possesions
SELECT whop as name, SUM(net)/SUM(poss)*100 as n_rating, SUM(pts)/SUM(poss)*100 AS o_rating, SUM(def)/SUM(poss)*100 AS d_rating
FROM  (
#Use a subquery to add column w/total points scored, points allowed, net, and possesions to each lineup
    SELECT *, 
    off_rating*pace*minutes/4800 AS pts, 
    def_rating*pace*minutes/4800 AS def, 
    net_rating*pace*minutes/4800 AS net, 
    pace*minutes/48 AS poss,
#Use case statements to identify which lineups have White, and which have Richardson    
    CASE 
    WHEN names LIKE '%White%' THEN 'White'
    #Remove Schroder from approved lineups
    WHEN names LIKE '%Richardson%' AND names NOT LIKE '%Schroder%'THEN 'Richardson'
    ELSE 'Neither'
    END AS whop
    FROM lineups
    ) AS cases
    #Exclude all lineups with neither player
    WHERE whop NOT LIKE 'Neither'
    #Group on the result of the case statement
    GROUP BY whop
    ;

    
#Compare net/off/def ratings and minutes played for lineups with Top 4 and White v. Richardson using LIKE and wild cards
SELECT id, names, net_rating, minutes, off_rating, def_rating
FROM lineups
WHERE names LIKE '%Tatum%' 
AND names LIKE '%Brown%'
AND names LIKE '%Williams I%'
AND names LIKE '%Smart%'
AND (
names LIKE '%White%'
OR names LIKE '%Richardson%')
;
