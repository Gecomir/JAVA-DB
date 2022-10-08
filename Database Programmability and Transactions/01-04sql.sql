# 1. Count Employees by Town
DELIMITER $$
CREATE FUNCTION ufn_count_employees_by_town(`town_name` VARCHAR(50)) 
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE e_count INT;
	    SET e_count := ( 
            SELECT COUNT(`employee_id`)
            FROM `employees`
            JOIN `addresses` USING (`address_id`)
            JOIN towns AS t USING (`town_id`)
            WHERE t.`name` = `town_name`
        );
    RETURN e_count;
END$$


# 2. Employees Promotion
DELIMITER $$
CREATE PROCEDURE usp_raise_salaries(`department_name` VARCHAR(50))
BEGIN
	UPDATE `employees` AS e
	JOIN `departments` AS d ON d.`department_id` = e.`department_id`
    SET `salary` = `salary` * 1.05
    WHERE d.`name` = `department_name`;
END$$
CALL `usp_raise_salaries`('Finance');


# 3. Employees Promotion by ID
DELIMITER $$
CREATE PROCEDURE usp_raise_salary_by_id (id INT)
BEGIN
	DECLARE count_by_id INT;
    START TRANSACTION;
    SET count_by_id:=(SELECT COUNT(*) FROM `employees`
    WHERE `employee_id` = id);
    UPDATE `employees` SET `salary` =`salary` * 1.05
    WHERE `employee_id`= id;
    
    IF(count_by_id < 1) THEN
		ROLLBACK;
    ELSE 
		COMMIT;
	END IF;
END$$


# 4. Triggered
DELIMITER $$
CREATE TABLE deleted_employees(
`employee_id` INT PRIMARY KEY AUTO_INCREMENT, 
`first_name` VARCHAR(50) NOT NULL,
`last_name` VARCHAR(50),
`middle_name` VARCHAR(50),
`job_title` VARCHAR(50),
`department_id` INT DEFAULT NULL,
`salary` DECIMAL(19, 4));

DELIMITER $$
CREATE TRIGGER tr_deleted_employees
AFTER DELETE
ON `employees`
FOR EACH ROW
BEGIN
	INSERT INTO `deleted_employees` (`first_name`, `last_name`, `middle_name`, `job_title`, `department_id`, `salary`) 
	VALUES (OLD.`first_name`, OLD.`last_name`, OLD.`middle_name`, OLD.`job_title`, OLD.`department_id`, OLD.`salary`);
END$$

