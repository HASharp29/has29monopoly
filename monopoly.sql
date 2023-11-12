DROP TABLE IF EXISTS PlayerLocation;
DROP TABLE IF EXISTS Cash;
DROP TABLE IF EXISTS House;
DROP TABLE IF EXISTS Hotel;
DROP TABLE IF EXISTS Property;
DROP TABLE IF EXISTS PlayerGame;
DROP TABLE IF EXISTS Player;
DROP TABLE IF EXISTS Game;

-- Create the schema.
CREATE TABLE Game (
	ID integer PRIMARY KEY,
	time timestamp
	);

CREATE TABLE Player (
	ID integer PRIMARY KEY, 
	emailAddress varchar(50) NOT NULL,
	name varchar(50)
	);

CREATE TABLE PlayerGame (
        ID integer PRIMARY KEY,
	gameID integer REFERENCES Game(ID), 
	playerID integer REFERENCES Player(ID),
	score integer
	);
CREATE TABLE Property (
    ID integer PRIMARY KEY,
    name varchar(50),
	playerGameID integer REFERENCES PlayerGame(ID) 
	);

CREATE TABLE House (
    ID integer PRIMARY KEY,
	property integer REFERENCES Property(ID)
	);

CREATE TABLE Hotel (
    ID integer PRIMARY KEY,
	property integer REFERENCES Property(ID)
	);

CREATE TABLE Cash (
    ID integer PRIMARY KEY,
    amount integer,
	playerGame integer REFERENCES PlayerGame(ID), 
    time timestamp
	);

CREATE TABLE PlayerLocation (
    ID integer PRIMARY KEY,
	playerGame integer REFERENCES PlayerGame(ID), 
    Property integer REFERENCES Property(ID), 
    time timestamp
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Game TO PUBLIC;
GRANT SELECT ON Player TO PUBLIC;
GRANT SELECT ON PlayerGame TO PUBLIC;
GRANT SELECT ON Property TO PUBLIC;
GRANT SELECT ON House TO PUBLIC;
GRANT SELECT ON Hotel TO PUBLIC;
GRANT SELECT ON Cash TO PUBLIC;
GRANT SELECT ON PlayerLocation TO PUBLIC;

-- Add sample records.
INSERT INTO Game VALUES (4, '2023-10-27 08:00:00');
INSERT INTO Game VALUES (1, '2006-06-27 08:00:00');
INSERT INTO Game VALUES (2, '2006-06-28 13:20:00');
INSERT INTO Game VALUES (3, '2006-06-29 18:41:00');

INSERT INTO Player(ID, emailAddress) VALUES (1, 'me@calvin.edu');
INSERT INTO Player VALUES (2, 'king@gmail.com', 'The King');
INSERT INTO Player VALUES (3, 'dog@gmail.com', 'Dogbreath');
INSERT INTO Player VALUES (4, 'kvlinden@calvin.edu', 'Keith Vander Linden');

INSERT INTO PlayerGame VALUES (1, 1, 1, 0.00);
INSERT INTO PlayerGame VALUES (2, 1, 2, 250.00);
INSERT INTO PlayerGame VALUES (3, 1, 3, 2350.00);
INSERT INTO PlayerGame VALUES (4, 2, 1, 1000.00);
INSERT INTO PlayerGame VALUES (5, 2, 2, 0.00);
INSERT INTO PlayerGame VALUES (6, 2, 3, 500.00);
INSERT INTO PlayerGame VALUES (7, 3, 2, 5000.00);
INSERT INTO PlayerGame VALUES (8, 3, 3, 5500.00);

INSERT INTO Property VALUES (1, 'Broadway', 1);
INSERT INTO Property VALUES (2, 'Breton', 1);
INSERT INTO Property VALUES (3, 'Burton', 3);

INSERT INTO House VALUES (1, 3);
INSERT INTO House VALUES (2, 3);
INSERT INTO House VALUES (3, 3);
INSERT INTO House VALUES (4, 3);

INSERT INTO Hotel VALUES (1, 3);

INSERT INTO Cash VALUES (1, 500, 1, '2006-06-27 08:00:00');
INSERT INTO Cash VALUES (2, 5000, 1, '2006-06-27 08:00:00');
INSERT INTO Cash VALUES (3, 3, 1, '2006-06-27 08:00:00');

INSERT INTO PlayerLocation VALUES (1, 1, 2, '2006-06-27 08:00:00');
INSERT INTO PlayerLocation VALUES (2,2,3, '2006-06-27 08:00:00');
INSERT INTO PlayerLocation VALUES (3,3,2, '2006-06-27 08:00:00');