CREATE DATABASE `minions`;

USE `minions`;

CREATE TABLE `minions` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255),
    `age` INT
);

USE `minions`;
CREATE TABLE `towns` (
    `town_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);