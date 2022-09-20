USE `soft_uni`;
#9. Find Names of All Employees
#f first, middle and last name (separated with single space) and they should be in one column called "Full Name"
SELECT CONCAT_WS(' ', `first_name`, `middle_name`, `last_name`) AS 'Full Name'
FROM `employees`
WHERE `salary` IN (25000, 14000, 12500,23600)
ORDER BY `employee_id`;