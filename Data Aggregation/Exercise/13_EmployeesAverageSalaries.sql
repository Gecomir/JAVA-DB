# 13. Employees Average Salaries
CREATE TABLE `high_paid_employees`
SELECT * FROM `employees`
WHERE `salary` > 30000;

DELETE FROM `high_paid_employees`
WHERE `manager_id` = 42;

UPDATE `high_paid_employees`
SET `salary` = `salary` + 5000
WHERE `department_id` = 1;

SELECT `department_id`, AVG(`salary`) AS `avg_salary` FROM `high_paid_employees`
GROUP BY `department_id`
ORDER BY `department_id` ASC;

# 13. Employees Average Salaries (Second way)
SELECT `department_id`,
IF (`department_id`=1, AVG(`salary`) + 5000, AVG(`salary`)) `avg_salary`
FROM `employees`
WHERE `salary` > 30000 AND `manager_id` NOT LIKE 42
GROUP BY `department_id`
ORDER BY `department_id`;