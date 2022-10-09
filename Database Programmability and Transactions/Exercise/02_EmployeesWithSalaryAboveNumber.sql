# 02. Employees with Salary Above Number
DELIMITER ##
CREATE PROCEDURE usp_get_employees_salary_above(`employee_salary` DECIMAL (19,4))
BEGIN
SELECT `first_name`, `last_name` FROM `employees`
WHERE `salary` >= `employee_salary`
ORDER BY `first_name`, `last_name`, `employee_id`;
END ##