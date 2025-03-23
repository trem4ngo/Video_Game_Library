-- REF_Genres Data Sets
INSERT INTO REF_Genres (genre_name, genre_description)
VALUES
('Strategy', 'Games that require tactical planning, resource management, and decision-making to achieve objectives.'),
('First Person Shooter', 'Action-packed games where players experience combat through the eyes of the protagonist, often involving firearms and fast-paced gameplay.'), 
('Puzzle', 'Games focused on problem-solving, logic, and pattern recognition, often featuring brain-teasing challenges.'),
('Simulation', 'Games that mimic real-life activities, such as driving, flying, farming, or managing a business, offering realistic experiences.'),
('Sandbox', 'Open-world games with creative freedom, allowing players to explore, build, and interact with the environment with minimal restrictions.'),
('Action', '‘Fast-paced games emphasizing physical challenges, combat, and reflex-based gameplay.'),
('Adventure', 'Story-driven games that involve exploration, puzzle-solving, and character interaction in immersive worlds.'),
('Survival', 'Games where players must gather resources, manage health, and fend off threats to stay alive in hostile environments.'),
('Role Playing Game', 'Games where players assume the roles of characters, progressing through quests, leveling up, and making story-altering decisions.'),
('Sports', 'Games that simulate real-world or fictional sports, allowing players to compete in individual or team-based events, often featuring realistic physics, rules, and strategies.');

-- REF_Platforms Dat Sets
INSERT INTO REF_Platforms (platform_name, platform_type)
VALUES
('Microsoft Windows', 'PC'),
('macOS', 'PC'),
('Linux', 'PC'),
('PlayStation 5', 'Console'),
('Xbox', 'Console'),
('Nintendo Switch', 'Console'),
('iOS', 'Mobile'),
('Android', 'Mobile');

INSERT INTO REF_Methods (method_name, method_description, is_active)
VALUES
('Credit Card', 'Payment through Visa or Mastercard', true),
('Bank Transfer', 'Online payment platform using email-linked accounts', true),
('Store Credit', 'Payment suing in-store credits or vouchers', true),
('Google Pay', 'Payment though Google’s digital wallet', true),
('GCash', 'Mobile Wallet payment service in the Philippines', true),
('Maya (PH)', 'Mobile Wallet payment service in the Philippines', true);

-- Games Data Set
INSERT INTO Games (game_name, release_date, developer, publisher, price)
VALUES
('Left 4 Dead 2', '2009-11-17', 'Valve', 'Valve', 335.00),
('Genshin Impact', '2020-09-28', 'miHoYo Co., Ltd.', 'miHoYo Co., Ltd.', 0.00),
('Minecraft: Bedrock Edition', '2016-11-18', 'Mojang Studios', 'Microsoft Studios', 1375.00),
('NBA 2k24', '2023-09-08', 'Visual Concepts', '2K Games', 2199.00),
('Dota 2', '2013-07-09', 'Valve', 'Valve', 0.00);

-- Users Data Set
INSERT INTO Users (first_name, last_name, birth_date, sex, contact_number, contact_email)
VALUES
('Francisco', 'Manuel', '2003-09-30', 'Male','09515429802', 'christophersori@gmail.com'), 
('Erika', 'Chua', '1999-05-23', 'Female', '09175125832', 'erika_chua@yahoo.com'), 
('Maximus', 'Sotelo', '2001-04-30', 'Male', '09231926518', 'maximo19@gmail.com'),  
('Christian', 'Tan', '2006-01-20', 'Male', '09175475253', 'christiantan_30@gmail.com'),
('Marian', 'Salazar', '2000-03-23', 'Female', '09228275693', 'salazar_marian@outlook.com');

-- Wallet Data Sets
INSERT INTO Wallets (wallet_balance, user_id)
VALUES (5000.31,(SELECT user_id FROM Users WHERE first_name = 'Francisco' LIMIT 1));

INSERT INTO Wallets (wallet_balance, user_id)
VALUES (12700.25,(SELECT user_id FROM Users WHERE first_name = 'Erika' LIMIT 1));

INSERT INTO Wallets (wallet_balance, user_id)
VALUES (748.00,(SELECT user_id FROM Users WHERE first_name = 'Maximus' LIMIT 1));

INSERT INTO Wallets (wallet_balance, user_id)
VALUES (2089.13,(SELECT user_id FROM Users WHERE first_name = 'Christian' LIMIT 1));

INSERT INTO Wallets (wallet_balance, user_id)
VALUES (14328.15,(SELECT user_id FROM Users WHERE first_name = 'Marian' LIMIT 1));

-- One by One Patches Insertion
INSERT INTO Patches (game_id, patch_title, patch_date, patch_time, patch_description)
VALUES ((SELECT game_id FROM Games WHERE game_name = 'Left 4 Dead 2'), '2.2.4.3', '2024-12-03', '03:55:00', 
'An update has been released for Left 4 Dead 2. - Fixed some exploits used to crash remote servers.'),
((SELECT game_id FROM Games WHERE game_name = 'Left 4 Dead 2'), '2.2.4.2', '2024-10-25', '04:58:00', 
'Fixed several crash and remote code execution exploits.Fixed a crash on some NVIDIA graphics cards when shader detail is set to High.');

INSERT INTO Patches (game_id, patch_title, patch_date, patch_time, patch_description)
VALUES((SELECT game_id FROM Games WHERE game_name = 'Genshin Impact'), 'Moonlight Amidst Dreams', '2025-02-12', '06:00:00', 
'New Characters: Embrace of Enchanting Dreams" and Yumemizuki Mizuki (5-Star Anemo Catalyst).
New Weapons: Sunny Morning Sleep-In (5-Star Catalyst) and Tamayuratei no Ohanashi (4-Star Polearm).
Event Wishes: Phase I - Dawns Drifting Reverie (Yumemizuki Mizuki) and Romaritime Meluserenity (Sigewinne) &
Phase II - Chanson of Many Waters (Furina)and Tempestuous Destiny (Wriothesley).'),
((SELECT game_id FROM Games WHERE game_name = 'Genshin Impact'), 'Incandescent Ode of Resurrection', '2025-01-01', '06:00:00', 
'New Characters: "Night-Igniting Flame" Mavuika (5-Star Pyro Claymore),
"Obsidian Opalstar" Citlali (5-Star Cryo Catalyst), and "Spring Woven From Jade" Lan Yan (4-Star Anemo Catalyst).
New Weapons: A Thousand Blazing Suns (5-Star Claymore) and Starcallers Watch (5-Star Catalyst).
Event Wishes: Phase I - Ancient Flame Ablaze (Mavuika) and Starry Nights Whispers (Citlali)
Phase II - The Hearths Ashen Shadow (Arlecchino & Lan Yan)');

INSERT INTO Patches (game_id, patch_title, patch_date, patch_time, patch_description)
VALUES ((SELECT game_id FROM Games WHERE game_name = 'Minecraft'), '1.21.62', '2025-02-25', 
'Gameplay: Fixed an issue where attacking a mob while sprint jumping would remove all player momentum (MCPE-189501) 
Fixed an issue where laggy players fighting would occasionally not be able to hit each other (MCPE-190552), 
Fixed an issue where Player collision box would sometimes be incorrect after using a bed (MCPE-190604)'),
((SELECT game_id FROM Games WHERE game_name = 'Minecraft'), '1.21.51', '2024-12-11', 
'General: Fixed several crashes that could occur during gameplay, Fixed issue where some shaped recipes were not parsing properly, 
Fixed issue where legacy data driven block did not apply the render layer from the material instances component');

SELECT game_id FROM Games WHERE game_name = 'NBA 2k24';
INSERT INTO Patches (game_id, patch_title, patch_date, patch_time, patch_description)
VALUES
('Season 5', 2025-02-23, '08:00:00', 'Various improvements to performance, stability, 
and visuals have been made to enhance the overall experience in the City and throughout MyCAREER'),
('Season 4', 2025-01-12, '8:00:00', 'The New York Knicks PA announcer will now make calls for the home team with the proper intensity
The following players have had general likeness updates or adjustments made: Chet Holmgren, Christie Sides (new player scan), 
Victor Wembanyama (default hair update), Han Xu (new player scan)');

SELECT game_id FROM Games WHERE game_name = 'Dota 2';
INSERT INTO Patches (game_id, patch_title, patch_date, patch_time, patch_description)
VALUES
('7.38b Gameplay Patch', 2025-03-05, '12:00:00', 'Patch 7.38b is out now, along with a new Dota Plus season. 
In addition, over the last few days we have addressed the following issues:
Fixed Clinkz Burning Army skeletons being able to auto-cast Tar Bomb,
Fixed Templar Assassin Hidden Reach effects being visible to enemies,
Fixed Sven Level 10 Talent +10% Vanquisher Bonus Damage not working properly, etc.'),
('7.37e', 2024-11-20, '12:00:00', 'Patch 7.37e is out now. 
Harpy Stormcrafter: Chain Lightning Mana Cost increased from 50 to 60.
Gleipnir: Health bonus decreased from 350 to 300, Eternal Chains damage decreased from 180 to 165.
Guardian Greaves: Mend health restored decreased from 350 to 325');

-- One by one games_owned insertion of data sets. Execute every line.
SELECT game_id FROM Games WHERE game_name = 'Left 4 Dead 2';
SELECT user_id FROM Users WHERE first_name = 'Marian' AND last_name = 'Salazar';
INSERT INTO Games_Owned (user_id, game_id) VALUES (user_id, games_id);
SELECT game_id FROM Games WHERE game_name = 'Minecraft: Bedrock Edition';
INSERT INTO Games_Owned (user_id, game_id) VALUES (user_id, games_id);

SELECT game_id FROM Games WHERE game_name = 'Genshin Impact';
SELECT user_id FROM Users WHERE contact_email = 'erika_chua@yahoo.com';
INSERT INTO Games_Owned (user_id, game_id) VALUES (user_id, games_id);

SELECT game_id FROM Games WHERE game_name = 'NBA 2k24';
SELECT user_id FROM Users WHERE contact_email = 'maximo19@gmail.com';
INSERT INTO Games_Owned (user_id, game_id) VALUES (user_id, games_id);

SELECT game_id FROM Games WHERE game_name = 'Dota 2';
SELECT user_id FROM Users WHERE first_name = 'Christian' AND last_name = 'Tan';
INSERT INTO Games_Owned (user_id, game_id) VALUES (user_id, games_id);

SELECT user_id FROM Users WHERE first_name = 'Francisco' AND last_name = 'Manuel';
SELECT game_id FROM Games WHERE game_name = 'Dota 2';
INSERT INTO Games_Owned (user_id, game_id) VALUES (user_id, games_id);
SELECT game_id FROM Games WHERE game_name = 'NBA 2k24';
INSERT INTO Games_Owned (user_id, game_id) VALUES (user_id, games_id);

-- Game_Genres Data Sets
SELECT game_id FROM Games WHERE game_name = 'NBA 2k24';
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Sports';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Simulation';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Adventure';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);

SELECT game_id FROM Games WHERE game_name = 'Left 4 Dead 2';
SELECT genre_id FROM Game_Genres WHERE genre_name = 'First Person Shooter';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Survival';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);
SELECT genre_id FROM Game_Genres WHERE genre_name = 'First Person Shooter';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);

SELECT game_id FROM Games WHERE game_name = 'Minecraft';
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Sandbox';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Adventure';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Survival';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Simulation';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);

SELECT game_id FROM Games WHERE game_name = 'Dota 2';
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Action';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Strategy';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);

SELECT game_id FROM Games WHERE game_name = 'Genshin Impact';
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Adventure';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Role Playing Game';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);	
SELECT genre_id FROM Game_Genres WHERE genre_name = 'Puzzle';
INSERT INTO Game_Genres (game_id, genre_id) VALUES (game_id, genre_id);	

-- Game_Platforms Data Sets 
SELECT game_id FROM Games WHERE game_name = 'Left 4 Dead 2';
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Steam';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'macOS';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Linux';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Microsoft Windows';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Xbox';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);

SELECT game_id FROM Games WHERE game_name = 'Genshin Impact';
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Microsoft Windows';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Playstation 5';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Android';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'iOS';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Xbox 360';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);

SELECT game_id FROM Games WHERE game_name = 'Minecraft';
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Microsoft Windows';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'macOS';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'iOS';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Android';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'PlayStation 5';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Xbox 360';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Linux';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);

SELECT game_id FROM Games WHERE game_name = 'NBA 2k24';
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Microsoft Windows';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'PlayStation 5';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Nintendo Switch';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);

SELECT game_id FROM Games WHERE game_name = 'Dota 2';
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Microsoft Windows';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'macOS';
INSERT INTO Game_Platforms (game_id, platform_id) VALUES (game_id, platform_id);
SELECT platform_id FROM ref_platforms WHERE platform_name = 'Linux';

-- Reviews Data Sets
