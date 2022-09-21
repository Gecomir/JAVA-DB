USE `soft_uni`;
#15. Create View Employees with Salaries
CREATE VIEW `v_employees_salaries` AS 
SELECT `first_name`, `last_name`, `salary` FROM `employees`
ORDER BY `employee_id`;

SELECT * FROM `v_employees_salaries`;
