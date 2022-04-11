# NBA_SQL
Boston Celtics lineup data project in SQL

The purpose of this project and the queries contained is to analyze data of the Celtics lineups for the 2021-2022 season to try to find insight into team performance. 

Data is stored in three tables:
  1) players - Data pulled from https://www.lineups.com/nba/player-stats with a unique player ID added. Contains players first and last name in the name field, and the player id in the ID field, along with a range of per game stats and a positional designation. *Note that for players who were traded away at the deadline and played on their new team prior to data being collected have the full season of stats, including the the games with their new team. 
  2) lineups - Data pulled from https://www.nba.com/stats/lineups/advanced/ filtering for Celtics lineups, with  unique lineup ID added. The data contains the fifty most played lineups the Celtics had used. The data contains a string field with the first name initial and last name of each of the five players in the lineup, along with a number of NBA advanced stats. 
  3) id_index - Data derived from the previous two tables using matching and trimming from Excel. This table maps the id for the five players in each lineup to the id that identifies that lineup. Used for joining the tables together. 

The file tables.sql creates each table, and the file import.sql imports the three files, saved as a CSV into the respective tables. 

The first goal is to be able to identify lineups with players of interest in them. This is dealt with in the player_find.sql file. Several methods are outlined there, but the simplest is to search using the string stored in lineup.names using LIKE and wild-cards. This can be extended to find lineups containing a group of players, or one player without another. A question particular to the Celtics is which player makes the strongest fifth player along with the so called "Big 4" that are the core of some of their strongest lineups. 
  
