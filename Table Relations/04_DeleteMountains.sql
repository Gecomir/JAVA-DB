# 4. Delete Mountains
CREATE TABLE mountains (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `name` VARCHAR(50));
   
CREATE TABLE peaks (
   `id` INT PRIMARY KEY AUTO_INCREMENT,
   `name` VARCHAR(50),
   `mountain_id` INT,
CONSTRAINT fk_p_m
FOREIGN KEY (mountain_id)
REFERENCES mountains(id)
ON DELETE CASCADE
);
