# 01. Create Tables
ALTER TABLE `products` 
ADD CONSTRAINT `fk_id_p_c`
 FOREIGN KEY `products` (`category_id`)
 REFERENCES `categories` (`id`);

# 02. Insert Data in Tables
ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(100);

# 03. Alter Table
CREATE TABLE `employees` (
`id` INT AUTO_INCREMENT PRIMARY KEY,
`first_name`  VARCHAR (100) NOT NULL,
`last_name` VARCHAR (100) NOT NULL
);

CREATE TABLE `categories` (
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR (100) NOT NULL
);

CREATE TABLE `products` (
`id` INT AUTO_INCREMENT PRIMARY KEY,
`name` VARCHAR (100) NOT NULL,
`category_id` INT NOT NULL

);

# 04. Adding Constraints
INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('Test1', 'Test1');
INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('Test2', 'Test2');
INSERT INTO `employees` (`first_name`, `last_name`) VALUES ('Test3', 'Test3');

# 05. Modifying Columns
ALTER TABLE `employees`
MODIFY COLUMN `middle_name` VARCHAR (100);
