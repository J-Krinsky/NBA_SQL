#Import player data
LOAD DATA LOCAL INFILE 'Celtics_players.csv' 
INTO TABLE players 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#Import lineup data
LOAD DATA LOCAL INFILE 'Celtics_lineups_c.csv' 
INTO TABLE lineups
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#Import the index for joining players and lineups
LOAD DATA LOCAL INFILE 'player_lineups.csv'
INTO TABLE id_index
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
;
