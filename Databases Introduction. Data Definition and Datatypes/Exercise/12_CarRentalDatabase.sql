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
