#Create a table to store players
CREATE TABLE players
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    team CHAR (3) NOT NULL,
    pos VARCHAR (2) NOT NULL,
    minutes DECIMAL(3,1) NOT NULL,
    points DECIMAL(3,1) NOT NULL,
    assists DECIMAL(3,1) NOT NULL,
    rebounds DECIMAL(3,1) NOT NULL,
    steals DECIMAL(3,1) NOT NULL,
    blocks DECIMAL(3,1) NOT NULL,
    turnovers DECIMAL(3,1) NOT NULL,
    o_rebounds DECIMAL(3,1) NOT NULL,
    3pm DECIMAL(3,1) NOT NULL,
    3pa DECIMAL(3,1) NOT NULL,
    ftm DECIMAL(3,1) NOT NULL,
    fta DECIMAL(3,1) NOT NULL,
    fouls DECIMAL(2,1) NOT NULL,
    rating INT NOT NULL
)
;
#Create a table to store lineup data
CREATE TABLE lineups
(
ID INT AUTO_INCREMENT PRIMARY KEY,
names VARCHAR(255) NOT NULL,
team CHAR(3) NOT NULL,
GP INT NOT NULL,
minutes INT NOT NULL,
off_rating INT NOT NULL,
def_rating INT NOT NULL,
net_rating INT NOT NULL,
assist_p DECIMAL(3,1) NOT NULL,
assist_TO DECIMAL(3,2) NOT NULL,
OREB DECIMAL(3,1) NOT NULL,
DREB DECIMAL(3,1) NOT NULL,
REB DECIMAL(3,1) NOT NULL,
TS DECIMAL(3,1) NOT NULL,
pace DECIMAL(5,2) NOT NULL
)
;

CREATE TABLE id_index
(
lineup_id INT NOT NULL,
player_id_one INT NOT NULL,
player_id_two INT NOT NULL,
player_id_three INT NOT NULL,
player_id_four INT NOT NULL,
player_id_five INT NOT NULL,
FOREIGN KEY(lineup_id) REFERENCES lineups(id),
FOREIGN KEY(player_id_one) REFERENCES players(id),
FOREIGN KEY(player_id_two) REFERENCES players(id),
FOREIGN KEY(player_id_three) REFERENCES players(id),
FOREIGN KEY(player_id_four) REFERENCES players(id),
FOREIGN KEY(player_id_five) REFERENCES players(id)
)
