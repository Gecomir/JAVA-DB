# 01. Managers
SELECT e.`employee_id`, CONCAT(e.`first_name`, ' ', e.`last_name`) AS `full_name`, d.`department_id`, d.`name` 
FROM `employees` AS e
RIGHT JOIN `departments` AS d
ON d.`manager_id` = e.`employee_id`
ORDER BY e.`employee_id`
LIMIT 5;

# 02. Towns and Addresses