DROP DATABASE IF EXISTS soccer_league; 

CREATE DATABASE soccer_league; 

\c soccer_league


-- ///////////////////////////////////////////////////////////////////////------
CREATE TABLE League_team
(
    id SERIAL PRIMARY KEY, 
    team_name TEXT
    league_standing INTEGER
);

INSERT INTO League_team
(team_name, league_standing)
VALUES 
('Team Red', 1),
('Team Green', 3),
('Team Pink', 2),
('Team Blue', 5),
('Team Black', 4);



-- ///////////////////////////////////////////////////////////////////////------
CREATE TABLE Goal_scored 
(
    id SERIAL PRIMARY KEY, 
    all_player_name_id INTEGER REFERENCES all_player_name, 
    total_score INTEGER
);


INSERT INTO Goal_scored
(all_player_name_id, total_score)
VALUES 
(1, 1),
(2, 0),
(3, 2),
(4, 3),
(5, 0),
(6, 0),
(7, 1),
(8, 0),
(9, 0),
(10,1);


-- ///////////////////////////////////////////////////////////////////////------

CREATE TABLE referee_list
(
    id SERIAL PRIMARY KEY, 
    referee_name TEXT
);


INSERT INTO referee_list
(referee_name)
VALUES 
('Steve Jobs'), 
('Albert Einstein'),
('Mark Lee');


-- ///////////////////////////////////////////////////////////////////////------

CREATE TABLE matches_list
(
    id SERIAL PRIMARY KEY, 
    match_no INTEGER, 
    league_team_id_team_1 INTEGER REFERENCES League_team ON DELETE CASCADE,
    league_team_id_team_2 INTEGER REFERENCES League_team ON DELETE CASCADE,
   
);

INSERT INTO matches_list
(match_no, league_team_id_team_1, league_team_id_team_2)
VALUES 
(1,1,5),
(2,2,4),
(3,3,4),
(5,5,1),
(6,1,3),
(7,3,1);

-- ///////////////////////////////////////////////////////////////////////------

CREATE TABLE season_list
(
    id SERIAL PRIMARY KEY, 
    start_season DATE,
    end_season DATE
);

INSERT INTO season_list
(start_season, end_season)
VALUES
('01/01/22','03/01/22'),
('04/01/22','07/01/22'),
('08/01/22','11/01/22');

-- ///////////////////////////////////////////////////////////////////////------


CREATE TABLE all_player_name
(
    id SERIAL PRIMARY KEY, 
    player_name TEXT,
    league_team_id INTEGER REFERENCES league_team ON DELETE CASCADE
);


INSERT INTO all_player_name
(player_name, league_team_id)
VALUES 
('Name 1',1),
('Name 2',2),
('Name 3',3),
('Name 4',4),
('Name 5',5),
('Name 6',5),
('Name 7',4),
('Name 8',3),
('Name 9',2),
('Name 10',1);

