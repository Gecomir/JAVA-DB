CREATE DATABASE `softuni_imdb`;
USE `softuni_imdb`;

CREATE TABLE `countries` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(30) NOT NULL UNIQUE,
	`continent` VARCHAR(30) NOT NULL,
	`currency` VARCHAR(5) NOT NULL
);

CREATE TABLE `genres` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE `actors` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`first_name` VARCHAR(50) NOT NULL,
	`last_name` VARCHAR(50) NOT NULL,
	`birthdate` DATE NOT NULL,
	`height` INT,
	`awards` INT,
	`country_id` INT NOT NULL,
	CONSTRAINT fk_actor_countrie
	FOREIGN KEY (`country_id`)
    REFERENCES `countries` (`id`)
);

CREATE TABLE `movies_additional_info` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`rating` DECIMAL(10, 2) NOT NULL,
	`runtime` INT NOT NULL,
	`picture_url` VARCHAR(80) NOT NULL,
	`budget` DECIMAL(10, 2),
	`release_date` DATE NOT NULL,
	`has_subtitles` TINYINT(1),
	`description` TEXT
);

CREATE TABLE `movies` (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`title` VARCHAR(70) UNIQUE,
	`country_id` INT NOT NULL,
	`movie_info_id` INT NOT NULL UNIQUE,
	CONSTRAINT fk_movie_countrie   
	FOREIGN KEY (`country_id`)
    REFERENCES `countries` (`id`),
	CONSTRAINT fk_movie_info
	FOREIGN KEY (`movie_info_id`)
    REFERENCES `movies_additional_info` (`id`)
);

CREATE TABLE `movies_actors` (
	`movie_id` INT,
	`actor_id` INT,
	KEY pk_movies_actors(`movie_id`, `actor_id`),
	CONSTRAINT fk_movie  
	FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`), 
	CONSTRAINT fk_actor 
	FOREIGN KEY (`actor_id`)  
    REFERENCES `actors` (`id`)
);

CREATE TABLE `genres_movies` (
	`genre_id` INT,
	`movie_id` INT,
	KEY pk_genres_movies(`genre_id`, `movie_id`),
	CONSTRAINT fk_movies 
	FOREIGN KEY (`movie_id`)
    REFERENCES `movies` (`id`), 
	CONSTRAINT fk_genre
	FOREIGN KEY (`genre_id`)
    REFERENCES `genres` (`id`)
);


# 02. Insert
INSERT INTO `actors` (`first_name`, `last_name`, `birthdate`, `height`, `awards`, `country_id`)
SELECT reverse(`first_name`), 
	reverse(`last_name`), 
	date_sub(`birthdate`, INTERVAL 2 DAY), 
	`height` + 10, 
	`country_id`, 
			(SELECT id FROM `countries`
            WHERE `name` LIKE 'Armenia')
    FROM `actors`
    WHERE `id` <= 10;


# 03. Update
UPDATE `movies_additional_info`
SET `runtime` = 
	CASE 
    WHEN `runtime` - 10 < 0 THEN  0 
    ELSE `runtime` - 10 
    END 
WHERE `id` BETWEEN 15 AND 25;


# 04 DELETE
DELETE c FROM `countries` AS c
LEFT JOIN `movies` AS m ON c.`id` = m.`country_id`
WHERE m.`country_id` IS NULL;

# 04 DELETE
DELETE c FROM `countries`
WHERE `id` NOT IN (SELECT `country_id` FROM `movies`);


# 05. Countries
SELECT * FROM `countries`
ORDER BY `currency` DESC, `id`;


# 06. Old movies
SELECT m.`id`, m.`title`, mai.`runtime`, mai.`budget`, mai.`release_date`
FROM `movies_additional_info` AS mai
JOIN `movies` AS m USING (`id`)
WHERE year(`release_date`) BETWEEN 1996 AND 1999
ORDER BY `runtime`,`id`
LIMIT 20;


# 07. Movie casting
SELECT 
	concat_ws(' ', `first_name`, `last_name`) AS `full_name`, 
	concat(reverse(`last_name`), length(`last_name`), '@cast.com') AS `email`,
	2022 - year(`birthdate`) AS `age`, `height`
FROM `actors`
LEFT JOIN `movies_actors` AS m 
ON `id` = m.`actor_id`
WHERE `actor_id` IS NULL
ORDER BY `height`;


# 08. International festival
SELECT c.`name`, COUNT(m.`id`) AS `movies_count`
FROM `movies` AS m
LEFT JOIN `countries` AS c 
ON m.`country_id` = c.`id`
GROUP BY m.`country_id`
HAVING `movies_count` >= 7
ORDER BY c.`name` DESC;


# 09. Rating system
SELECT m.`title`,
	CASE
		WHEN mai.`rating` <= 4 THEN 'poor'
		WHEN mai.`rating` <= 7 THEN 'good'
		ELSE 'excellent'
	END AS `rating`,
	IF(mai.`has_subtitles`, 'english', '-') AS `subtitles`, 
	mai.`budget`
FROM `movies` AS m
JOIN `movies_additional_info` AS mai USING (`id`) 
ORDER BY mai.`budget` DESC;


# 10. History movies
DELIMITER ##
CREATE FUNCTION udf_actor_history_movies_count(full_name VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE history_movies INT;
    SET history_movies := (
		SELECT count(ma.`movie_id`)
        FROM `movies_actors` AS ma
        JOIN `actors` AS a
        ON ma.`actor_id` = a.`id`
        JOIN `genres_movies` AS gm ON gm.`movie_id` = ma.`movie_id`
        JOIN `genres` AS g ON gm.`genre_id` = g.`id`
        WHERE CONCAT_WS(' ', a.`first_name`, a.`last_name`) = full_name AND g.`name` = 'History'
        GROUP BY ma.`actor_id`
    );
    RETURN history_movies;
END##


# 11. Movie awards
DELIMITER ##
CREATE PROCEDURE udp_award_movie(movie_title VARCHAR(50))
BEGIN
	UPDATE `actors` AS a
	JOIN `movies_actors` AS ma ON a.`id` = ma.`actor_id`
    JOIN `movies` AS m ON ma.`movie_id` = m.`id`
    SET a.`awards` = a.`awards` + 1
	WHERE m.`title` = `movie_title`;
END##
