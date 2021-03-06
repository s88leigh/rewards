-- test database
DROP DATABASE IF EXISTS rewards_db;
CREATE DATABASE rewards_db;
USE rewards_db; 

-- Heroku database
DROP DATABASE IF EXISTS vphg7hb2l22od01x;
CREATE DATABASE vphg7hb2l22od01x;
USE vphg7hb2l22od01x;


-- parent table
DROP TABLE IF EXISTS parents;
CREATE TABLE parents (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	alt_email VARCHAR(255),
    createdAt DATETIME DEFAULT current_timestamp,
    updatedAt DATETIME DEFAULT current_timestamp
	);


-- child table
DROP TABLE IF EXISTS kids;
CREATE TABLE kids (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL,
	points INTEGER DEFAULT 0,
	Parent1Id INTEGER NOT NULL,
    createdAt DATETIME DEFAULT current_timestamp,
    updatedAt DATETIME DEFAULT current_timestamp,
	FOREIGN KEY (Parent1Id)
		REFERENCES parents(id)
	);
    
    
-- chores table
DROP TABLE IF EXISTS chores;
CREATE TABLE chores (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL UNIQUE,
	points INTEGER NOT NULL,
    iconfile VARCHAR(255) DEFAULT 'wash_dish.png',
    createdAt DATETIME DEFAULT current_timestamp,
    updatedAt DATETIME DEFAULT current_timestamp
	);


-- rewards table
DROP TABLE IF EXISTS rewards;
CREATE TABLE rewards (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	title VARCHAR(255) NOT NULL UNIQUE,
	points INTEGER NOT NULL,
	iconfile VARCHAR(255) DEFAULT 'salary (1).png',
    createdAt DATETIME DEFAULT current_timestamp,
    updatedAt DATETIME DEFAULT current_timestamp
	);

-- doneChores table
DROP TABLE IF EXISTS donechores;
CREATE TABLE donechores (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	ChoreId INTEGER,
	KidId INTEGER,
	createdAt DATETIME DEFAULT current_timestamp,
    updatedAt DATETIME DEFAULT current_timestamp,
	FOREIGN KEY (ChoreId)
		REFERENCES chores(id),
	FOREIGN KEY (KidId)
		REFERENCES kids(id)
	);

-- usedpoints table
DROP TABLE IF EXISTS usedpoints;
CREATE TABLE usedpoints (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	RewardId INTEGER,
	KidId INTEGER,
    createdAt DATETIME DEFAULT current_timestamp,
    updatedAt DATETIME DEFAULT current_timestamp,
	FOREIGN KEY (RewardId)
		REFERENCES rewards(id),
	FOREIGN KEY (KidId)
		REFERENCES kids(id)
	);

-- assignedchores table
DROP TABLE IF EXISTS assignedchores;
CREATE TABLE assignedchores (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
	ChoreId INTEGER,
	KidId INTEGER,
	createdAt DATETIME DEFAULT current_timestamp,
    updatedAt DATETIME DEFAULT current_timestamp,
	FOREIGN KEY (ChoreId)
		REFERENCES chores(id),
	FOREIGN KEY (KidId)
		REFERENCES kids(id)
	);