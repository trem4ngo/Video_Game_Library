CREATE DATABASE IF NOT EXISTS gamelibrary;
USE gamelibrary;

/*
-- ID AUTO_INCREMENT Starts:
-- game_id starts at 100
-- patch_id starts at 1000
-- genre_id starts at 2000
-- platform_id starts at 3000
-- transaction_id starts at 4000
-- method_id starts at 5000
-- user_id starts at 6000
-- wallet_id starts at 7000
-- review_id starts at 8000
*/

-- Games Table
-- INSERT INTO Games (game_name, release_date, developer, publisher, availability, price) VALUES (...), (...);
DROP TABLE IF EXISTS Games;
CREATE TABLE Games (
	game_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    game_name VARCHAR(45) NOT NULL UNIQUE,
    release_date DATE DEFAULT (CURRENT_DATE) NOT NULL,
    developer VARCHAR(50) NOT NULL,
    publisher VARCHAR(50) NOT NULL,
    availability BOOLEAN NOT NULL,
    price DECIMAL(7,2) NOT NULL
) AUTO_INCREMENT = 100;

-- Users Table
-- INSERT INTO Users (first_name, last_name, birth_date, sex, contact_number, contact_email) VALUES (...), (...);
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
	user_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    sex VARCHAR(10),
    contact_number VARCHAR(15) NOT NULL UNIQUE,
    contact_email VARCHAR(50) NOT NULL UNIQUE
) AUTO_INCREMENT = 6000;

-- Patches Table
-- INSERT INTO Patches (game_id, patch_title, patch_date, patch_time, patch_description) VALUES (...), (...);
DROP TABLE IF EXISTS Patches;
CREATE TABLE Patches (
	patch_id INT(5) AUTO_INCREMENT PRIMARY KEY,
	game_id INT(5) NOT NULL,
    patch_title VARCHAR(50),
    patch_date DATE DEFAULT (CURRENT_DATE),
    patch_time TIME DEFAULT (CURRENT_TIME),
    patch_description VARCHAR(500),
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE CASCADE
) AUTO_INCREMENT = 1000;

-- Reference Genres Table
-- INSERT INTO REF_Genres (genre_name, genre_description) VALUES (...), (...);
DROP TABLE IF EXISTS REF_Genres;
CREATE TABLE REF_Genres (
	genre_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50) NOT NULL UNIQUE,
    genre_description VARCHAR(500)
) AUTO_INCREMENT = 2000;

-- Reference Platforms Table
-- INSERT INTO REF_Platforms (platform_name, platform_type) VALUES (...), (...);
DROP TABLE IF EXISTS REF_Platforms;
CREATE TABLE REF_Platforms (
	platform_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    platform_type VARCHAR(30) NOT NULL,
    platform_name VARCHAR(50) NOT NULL UNIQUE
) AUTO_INCREMENT = 3000;

-- Game Genres Table
-- INSERT INTO Game_Genres (game_id, genre_id) VALUES (...), (...);
DROP TABLE IF EXISTS Game_Genres;
CREATE TABLE Game_Genres (
	game_id INT(5),
    genre_id INT(5),
    PRIMARY KEY(game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES REF_Genres(genre_id) ON DELETE CASCADE
);

-- Game Platforms Table
-- INSERT INTO Game_Platforms (game_id, platform_id) VALUES (...), (...);
DROP TABLE IF EXISTS Game_Platforms;
CREATE TABLE Game_Platforms (
	game_id INT(5),
    platform_id INT(5),
    PRIMARY KEY(game_id, platform_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE CASCADE,
    FOREIGN KEY (platform_id) REFERENCES REF_Platforms(platform_id) ON DELETE CASCADE
);

-- Transactions Table
-- INSERT INTO Transactions (game_id, user_id, method_id, transaction_amount, transaction_date, online_url, transaction_status) VALUES (...), (...);
DROP TABLE IF EXISTS Transactions;
CREATE TABLE Transactions (
	transaction_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    game_id INT(5) NOT NULL,
    user_id INT(5) NOT NULL,
    method_id INT(5) NOT NULL,
    transaction_amount DECIMAL(9,2) NOT NULL DEFAULT 0.00,
    transaction_date DATE NOT NULL DEFAULT (CURRENT_DATE),
    transaction_status ENUM('completed','pending','failed') NOT NULL,
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE RESTRICT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE RESTRICT,
    FOREIGN KEY (method_id) REFERENCES REF_Methods(method_id) ON DELETE RESTRICT
) AUTO_INCREMENT = 4000;

-- Reference Payment Methods Table
-- INSERT INTO REF_Methods (method_name, method_description, is_active) VALUES (...), (...);
DROP TABLE IF EXISTS REF_Methods;
CREATE TABLE REF_Methods (
	method_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50) NOT NULL UNIQUE,
    method_description VARCHAR(500),
    is_active BOOLEAN NOT NULL
) AUTO_INCREMENT = 5000;

-- User Wallets Table
-- INSERT INTO Wallets (wallet_balance) VALUES (...), (...);
DROP TABLE IF EXISTS Wallets;
CREATE TABLE Wallets (
	wallet_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    user_id INT(5) NOT NULL UNIQUE,
    wallet_balance DECIMAL(9,2) DEFAULT 0.00,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
) AUTO_INCREMENT = 7000;

-- Games Owned Table
-- INSERT INTO Games (user_id, game_id) VALUES (...), (...);
DROP TABLE IF EXISTS Games_Owned;
CREATE TABLE Games_Owned (
	user_id INT(5) NOT NULL,
    game_id INT(5) NOT NULL,
    PRIMARY KEY(user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE CASCADE
);

-- Game Reviews Table
-- INSERT INTO Reviews (game_id, user_id, review, rating) VALUES (...), (...);
DROP TABLE IF EXISTS Reviews;
CREATE TABLE Reviews (
	review_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    game_id INT(5) NOT NULL,
    user_id INT(5) NOT NULL,
    review_text VARCHAR(500),
    rating int(2) CHECK (rating BETWEEN 0 AND 10),
    FOREIGN KEY (game_id) REFERENCES Games(game_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
) AUTO_INCREMENT = 8000; 
