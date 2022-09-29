# 01 Select employee information
SELECT `id`, `first_name`, `last_name`, `job_title` FROM `employees`
ORDER BY `id`;

# 02 Select employees with filter
SELECT `id`,CONCAT(`first_name`, ' ', `last_name`) AS 'full_name',
    `job_title` AS 'Job Title',
    `salary` AS 'Salary'
FROM`employees`
WHERE`salary` > 1000
ORDER BY `id`;

# 03 Update salary and select
UPDATE `employees` 
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';
SELECT `salary` FROM `employees`;

# 04 Top paid employee
SELECT * FROM `employees`
ORDER BY `salary` DESC
LIMIT 1;

CREATE VIEW `v_top_paid_employee` AS
SELECT * FROM `employees`
ORDER BY `salary` DESC
LIMIT 1;

SELECT * FROM `v_top_paid_employee`;

# 05 Select employees by multiple filters
SELECT * FROM `employees`
WHERE `department_id` = 4 AND `salary` >=1000;

# 06 Delete from table
DELETE FROM `employees`
WHERE `department_id` = 1 OR `department_id` = 2;
-- WHERE `department_id` IN (1, 2);
-- WHERE `department_id` BETWEEN 1 AND 2;
SELECT * FROM `employees`
ORDER BY `id`;
