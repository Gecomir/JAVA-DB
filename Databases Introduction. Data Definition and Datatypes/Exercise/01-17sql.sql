# 01. Create Tables
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

# 02. Alter Minions Table
ALTER TABLE `minions`
ADD COLUMN `town_id` INT NOT NULL,
ADD CONSTRAINT fk_minions_towns
FOREIGN KEY (`town_id`)
REFERENCES `towns` (`id`);

# 03. Insert Records in Both Tables
INSERT INTO `towns` (`id`, `name`)
VALUES (1, "Sofia"), (2, "Plovdiv"), (3, "Varna");

INSERT INTO `minions` (`id`, `name`, `age`, `town_id`)
VALUES (1, "Kevin", 22, 1), (2, "Bob", 15, 3), (3,"Steward", NULL , 2);

# 04. Truncate Table Minions
TRUNCATE TABLE `minions`;

# 05. Drop All Tables
DROP TABLE `minions`;
DROP TABLE `towns`;

# 06. Create Table People
CREATE TABLE `people` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` DOUBLE(10 , 2 ),
    `weight` DOUBLE(10 , 2 ),
    `gender` CHAR(1) NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

INSERT INTO `people` (`name`, `gender`, `birthdate`)
VALUES
("Joro", 'M', DATE(now())),
("Ivan", 'M', DATE(now())),
("Mira", 'F', DATE(now())),
("Jenq", 'F', DATE(now())),
("Koko", 'M', DATE(now()));

# 07. Create Table Users
CREATE TABLE `users` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIME,
    `is_deleted` BOOLEAN
);

INSERT INTO `users` (`username`, `password`)
VALUES 
("Gecomir", "12345"),
("Kolibri", "@312iew"),
("username", "password"),
("username", "password"),
("username", "password");

# 08. Change Primary Key
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD PRIMARY KEY pk_users (`id`, `username`);

# 9. Set Default Value of a Field
ALTER TABLE `users`
MODIFY COLUMN `last_login_time` DATETIME DEFAULT NOW();

# 10. Set Unique Field
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_users
PRIMARY KEY `users` (`id`),
MODIFY COLUMN `username` VARCHAR (30) UNIQUE;

# 11. Movies Database
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

# 12. Car Rental Database
CREATE DATABASE car_rental;

USE `car_rental`;
CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `category` VARCHAR(50) NOT NULL,
    `daily_rate` INT,
    `weekly_rate` INT,
    `monthly_rate` INT,
    `weekend_rate` INT
);
 
 INSERT INTO `categories` (`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`) VALUES ('sport', 10, 10, 10, 10);
 INSERT INTO `categories` (`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`) VALUES ('daily', 2, 2, 2, 2);
 INSERT INTO `categories` (`category`) VALUES ('old');

USE `car_rental`;
CREATE TABLE `cars` (
    `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `plate_number` VARCHAR(10) NOT NULL,
    `make` VARCHAR(20) NOT NULL,
    `model` VARCHAR(10),
    `car_year` INT(4),
    `category_id` INT NOT NULL,
    `doors` INT(1),
    `picture` BLOB,
    `car_condition` VARCHAR(20),
    `available` BOOLEAN NOT NULL
);

INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `category_id`, `doors`, `car_condition`, `available`)
VALUES ('C 1234 QW', 'Nissan', 'Z21', 1967, 3, 3, 'good', TRUE);
INSERT INTO `cars` (`plate_number`, `make`, `category_id`, `available`) VALUES ('B 5678 TX', 'Nissan', 1, TRUE);
INSERT INTO `cars` (`plate_number`, `make`, `category_id`, `available`) VALUES ('A 5678 TX', 'Trabant', 1, FALSE);

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `first_name` VARCHAR(15) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `title` VARCHAR(20) NOT NULL,
    `notes` TEXT
);
  
  INSERT INTO `employees` (`first_name`, `last_name`, `title`, `notes`)
  VALUES ('Ivan', 'Ivanov', 'director', 'proba'),
		 ('Milka', 'Draganova', 'casier', 'proba'),
         ('Pesho', 'Peshev', 'driver', 'proba');

USE `car_rental`;
CREATE TABLE `customers` (
    `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `driver_licence_number` INT NOT NULL,
    `full_name` VARCHAR(50) NOT NULL,
    `address` VARCHAR(50),
    `city` VARCHAR(20),
    `zip_code` INT(4),
    `notes` TEXT
);
  
  INSERT INTO `customers` (`driver_licence_number`, `full_name`, `address`, `city`, `zip_code`, `notes`)
  VALUES (123456, 'Ivan Ivanov', 'street Nezabravka 10', 'Varna', 9000, 'the best driver');
  INSERT INTO `customers` (`driver_licence_number`, `full_name`)
  VALUES (456789, 'Milka Draganova'),
         (741852, 'Pesho Peshev');

CREATE TABLE `rental_orders` (
    `id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `employee_id` INT NOT NULL,
    `customer_id` INT NOT NULL,
    `car_id` INT NOT NULL,
    `car_condition` VARCHAR(20),
    `tank_level` ENUM('FULL', 'HALF', 'EMPTY'),
    `kilometrage_start` INT NOT NULL,
    `kilometrage_end` INT,
    `total_kilometrage` INT DEFAULT 0,
    `start_date` DATE NOT NULL,
    `end_date` DATE,
    `total_days` INT DEFAULT 0,
    `rate_applied` BOOLEAN DEFAULT FALSE,
    `tax_rate` DECIMAL(6 , 2 ) NOT NULL,
    `order_status` ENUM('ORDERED', 'FULFILLED') DEFAULT 'ORDERED',
    `notes` TEXT
);
  
  INSERT INTO `rental_orders` 
    (`employee_id`, `customer_id`, `car_id`, `car_condition`, `tank_level`, `kilometrage_start`, `kilometrage_end`, `total_kilometrage`, 
    `start_date`, `end_date`, `total_days`, `rate_applied`, `tax_rate`, `order_status`)
  VALUES (1, 1, 1, 'Perfect', 'FULL', 1000, 3000, 2000, '2022-01-01', '2022-01-02', 1, TRUE, 20.05, 'FULFILLED');
  
  INSERT INTO `rental_orders` 
    (`employee_id`, `customer_id`, `car_id`, `tank_level`, `kilometrage_start`, `start_date`, `tax_rate`)
  VALUES
			(2, 2, 2, 'HALF', 1000, '2022-01-01', 350.2),
			(3, 3, 3, 'FULL', 1000, '2022-01-11', 8.56);

# 13. Basic Insert
CREATE TABLE `towns` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `addresses` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `address_text` VARCHAR(100),
    `town_id` INT
);

CREATE TABLE `departments` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(100) NOT NULL,
    `middle_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(100) NOT NULL,
    `job_title` VARCHAR(100),
    `department_id` INT NOT NULL,
    `hire_date` DATE,
    `salary` DECIMAL(10,2),
    `address_id` INT
);

INSERT INTO `towns` (`name`)
VALUES ("Sofia"), ("Plovdiv"), ("Varna"), ("Burgas");

INSERT INTO `departments` (`name`)
VALUES ("Engineering"), ("Sales"), ("Marketing"), ("Software Development"), ("Quality Assurance");

INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES 
    ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013/02/01', 3500.00),
	('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004/03/02',	4000.00),
	('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016/08/28',	525.25),
	('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007/12/09', 3000.00),
	('Peter', 'Pan', 'Pan', 'Intern', 3, '2016/08/28',	599.88);

# 14. Basic Select All Fields
SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

# 15. Basic Select All Fields and Order Them
SELECT * FROM `towns`
ORDER BY `name`;

SELECT * FROM `departments`
ORDER BY `name`;

SELECT * FROM `employees`
ORDER BY `salary` DESC;

# 16. Basic Select Some Fields
SELECT `name` FROM `towns`
ORDER BY `name`;

SELECT `name` FROM `departments`
ORDER BY `name`;

SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC;

# 17. Increase Employees Salary
UPDATE `employees`
SET `salary`= `salary` * 1.10;
SELECT `salary` FROM `employees`
