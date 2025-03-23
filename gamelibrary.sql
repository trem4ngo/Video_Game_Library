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
-- INSERT INTO Games (release_date, developer, publisher, availability, price) VALUES (...), (...);
DROP TABLE IF EXISTS Games;
CREATE TABLE Games (
	game_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    release_date DATE,
    developer VARCHAR(50),
    publisher VARCHAR(50),
    availability BOOLEAN,
    price DECIMAL(5,2)
) AUTO_INCREMENT = 100;

-- Patches Table
-- INSERT INTO Patches (game_id, patch_title, patch_date, patch_time, patch_description) VALUES (...), (...);
DROP TABLE IF EXISTS Patches;
CREATE TABLE Patches (
	patch_id INT(5) AUTO_INCREMENT PRIMARY KEY,
	game_id INT(5),
    patch_title VARCHAR(50),
    patch_date DATE,
    patch_time TIME,
    patch_description VARCHAR(500),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
) AUTO_INCREMENT = 1000;

-- Reference Genres Table
-- INSERT INTO REF_Genres (genre_name, genre_description) VALUES (...), (...);
DROP TABLE IF EXISTS REF_Genres;
CREATE TABLE REF_Genres (
	genre_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(50),
    genre_description VARCHAR(500)
) AUTO_INCREMENT = 2000;

-- Reference Platforms Table
-- INSERT INTO REF_Platforms (platform_name) VALUES (...), (...);
DROP TABLE IF EXISTS REF_Platforms;
CREATE TABLE REF_Platforms (
	platform_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    platform_name VARCHAR(50)
) AUTO_INCREMENT = 3000;

-- Game Genres Table
-- INSERT INTO Game_Genres (game_id, genre_id) VALUES (...), (...);
DROP TABLE IF EXISTS Game_Genres;
CREATE TABLE Game_Genres (
	game_id INT(5),
    genre_id INT(5),
    PRIMARY KEY(game_id, genre_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (genre_id) REFERENCES REF_Genres(genre_id)
);

-- Game Platforms Table
-- INSERT INTO Game_Platforms (game_id, platform_id) VALUES (...), (...);
DROP TABLE IF EXISTS Game_Platforms;
CREATE TABLE Game_Platforms (
	game_id INT(5),
    platform_id INT(5),
    PRIMARY KEY(game_id, platform_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (platform_id) REFERENCES REF_Platforms(platform_id)
);

-- Transactions Table
-- INSERT INTO Transactions (game_id, user_id, payment_id, transaction_amount, transaction_date, online_url, transaction_status) VALUES (...), (...);
DROP TABLE IF EXISTS Transactions;
CREATE TABLE Transactions (
	transaction_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    game_id INT(5),
    user_id INT(5),
    method_id INT(5),
    transaction_amount DECIMAL(9,2),
    transaction_date DATE,
    online_url VARCHAR(100),
    transaction_status ENUM('completed','pending','failed'),
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (payment_id) REFERENCES Payment(payment_id)
) AUTO_INCREMENT = 4000;

-- Reference Payment Methods Table
-- INSERT INTO REF_Methods (method_name, method_description, is_active) VALUES (...), (...);
DROP TABLE IF EXISTS REF_Methods;
CREATE TABLE REF_Methods (
	method_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(50),
    method_description VARCHAR(500),
    is_active BOOLEAN
) AUTO_INCREMENT = 5000;

-- Users Table
-- INSERT INTO Users (wallet_id, first_name, last_name, birth_date, sex, contact_number, contact_email) VALUES (...), (...);
DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
	user_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    wallet_id INT(5),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birth_date DATE,
    sex VARCHAR(10),
    contact_number INT(15),
    contact_email VARCHAR(50),
    FOREIGN KEY (wallet_id) REFERENCES Wallets(wallet_id)
) AUTO_INCREMENT = 6000;

-- User Wallets Table
-- INSERT INTO Wallets (wallet_balance) VALUES (...), (...);
DROP TABLE IF EXISTS Wallets;
CREATE TABLE Wallets (
	wallet_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    wallet_balance DECIMAL(9,2)
) AUTO_INCREMENT = 7000;

-- Games Owned Table
-- INSERT INTO Games (user_id, game_id) VALUES (...), (...);
DROP TABLE IF EXISTS Games_Owned;
CREATE TABLE Games_Owned (
	user_id INT(5),
    game_id INT(5),
    PRIMARY KEY(user_id, game_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (game_id) REFERENCES Games(game_id)
);

-- Game Reviews Table
-- INSERT INTO Reviews (game_id, user_id, review, rating) VALUES (...), (...);
DROP TABLE IF EXISTS Reviews;
CREATE TABLE Reviews (
	review_id INT(5) AUTO_INCREMENT PRIMARY KEY,
    game_id INT(5),
    user_id INT(5),
    review VARCHAR(500),
    rating int(2),
    FOREIGN KEY (game_id) REFERENCES Games(game_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
) AUTO_INCREMENT = 8000;
