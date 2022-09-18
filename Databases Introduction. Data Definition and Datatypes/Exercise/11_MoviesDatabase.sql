CREATE DATABASE `Movies`;

USE `movies`;
CREATE TABLE `directors` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(100) NOT NULL,
    `notes` TEXT
);

USE `movies`;
INSERT INTO `directors` (`director_name`, `notes`)
VALUE
("George", "tralala"),
("Ivan", "abrakadabra"),
("Peter", "silence"),
("Sam", "pas"),
("Anica", "test");


USE `movies`;
CREATE TABLE `genres` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(100) NOT NULL,
    `notes` TEXT
);

USE `movies`;
INSERT INTO `genres` (`genre_name`, `notes`)
VALUES 
("Tralala", "opsa"),
("Serial", "ixa"),
("Joro", "film"),
("Ivan", "futbol"),
("Gun", "three");


USE `movies`;
CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(100) NOT NULL,
    `notes` TEXT
);

USE `movies`;
INSERT INTO `categories`(`category_name`, `notes`) 
VALUES
("drama", "EdinZaDrug"),
("komedia", "Gun"),
("triler", "Fast"),
("ekshan", "Rambo"),
("horror", "WrongTurn");


USE `movies`;
CREATE TABLE `movies` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `director_id` INT NOT NULL,
    `copyright_year` VARCHAR(4) NOT NULL,
    `length` INT,
    `genre_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `rating` DOUBLE(10 , 1 ),
    `notes` TEXT
);

USE `movies`;
INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `genre_id`, `category_id`, `rating`, `notes`)
VALUES 
("Rambo", 1, 1995, 4, 8, 5.1, "super"),
("Fast", 2, 2000, 5, 3, 6.3, "biva"),
("Avatar", 3, 2015, 6 , 7, 9.9, "strahoten"),
("Transporter", 4, 2010, 6, 10, 9.5, "good"),
("Cars", 5, 2001, 4,5, 4.5, "xaxa");