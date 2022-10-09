# 01. Employees with Salary Above 35000
DELIMITER ##
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
SELECT `first_name`, `last_name` FROM `employees`
WHERE `salary` > 35000
ORDER BY `first_name`,`last_name`, `employee_id`;
END ##


# 02. Employees with Salary Above Number
DELIMITER ##
CREATE PROCEDURE usp_get_employees_salary_above (`employee_salary` DECIMAL (19,4))
BEGIN
SELECT `first_name`, `last_name` FROM `employees`
WHERE `salary` >= `employee_salary`
ORDER BY `first_name`, `last_name`, `employee_id`;
END ##


# 03. Town Names Starting With
DELIMITER ##
CREATE PROCEDURE usp_get_towns_starting_with (`started_with` VARCHAR(50))
BEGIN
SELECT `name` FROM `towns`
WHERE `name` LIKE CONCAT(started_with, '%')
ORDER BY `name`;
END ##


# 04. Employees from Town
DELIMITER ##
CREATE PROCEDURE usp_get_employees_from_town(searched_town VARCHAR(50))
BEGIN
SELECT `first_name`, `last_name` FROM `employees` AS e
JOIN `addresses` AS a USING (`address_id`)
JOIN `towns` AS t USING (`town_id`)
WHERE t.`name` = searched_town
ORDER BY `first_name`, `last_name`;
END ##


# 05. Salary Level Function
DELIMITER ##
CREATE FUNCTION ufn_get_salary_level (salary DECIMAL(19,4))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE salary_level VARCHAR(10);
    IF (salary < 30000) THEN SET salary_level := 'Low';
    ELSEIF (salary <= 50000) THEN SET salary_level := 'Average';
    ELSE SET salary_level := 'High';
    END IF;
	RETURN salary_level;
END ##