# 01. Managers
SELECT e.`employee_id`, CONCAT(e.`first_name`, ' ', e.`last_name`) AS `full_name`, d.`department_id`, d.`name` 
FROM `employees` AS e
RIGHT JOIN `departments` AS d
ON d.`manager_id` = e.`employee_id`
ORDER BY e.`employee_id`
LIMIT 5;


# 02. Towns and Addresses
SELECT t.`town_id`, t.`name`, a.`address_text`
FROM addresses AS a
JOIN towns AS t
ON t.`town_id`= a.`town_id`
WHERE t.`name` IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY t.`town_id`, a.`address_id`;


# 3. Employees Without Managers
SELECT e.`employee_id`, e.`first_name`, e.`last_name`, e.`department_id`, e.`salary`
FROM `employees` AS e
RIGHT JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE e.`manager_id` IS NULL;

# 04. Higher Salary
SELECT COUNT(employee_id) FROM `employees`
WHERE `salary`> (
SELECT AVG(`salary`) FROM `employees`
);