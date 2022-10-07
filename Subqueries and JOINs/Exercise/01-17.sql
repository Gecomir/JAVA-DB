# 01. Employee Address
SELECT e.`employee_id`, e.`job_title`, e.`address_id`, a.`address_text` 
FROM `employees` AS e
JOIN `addresses` AS a
ON e.`address_id`= a.`address_id`
ORDER BY e.`address_id`
LIMIT 5;

# 02. Addresses with Towns
SELECT e.`first_name`, e.`last_name`, t.`name`, a.`address_text`
FROM `employees` AS e
JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`
JOIN `towns` AS t
ON t.`town_id`= a.`town_id`
ORDER BY e.`first_name`, e.`last_name`
LIMIT 5;

# 03. Sales Employee
SELECT e.`employee_id`, e.`first_name`, e.`last_name`, d.`name` AS `department_name`
FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id`= d.`department_id`
WHERE d.`name` LIKE  'Sales'
ORDER BY e.`employee_id` DESC;

# 04. Employee Departments
SELECT e.`employee_id`, e.`first_name`, e.`salary`, d.`name` AS `department_name`
FROM `employees` AS e
RIGHT JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE e.`salary` > 15000
ORDER BY d.`department_id` DESC
LIMIT 5;

# 05. Employees Without Project
SELECT e.`employee_id`, e.`first_name`
FROM `employees` AS e
LEFT JOIN `employees_projects` AS p
ON e.`employee_id` = p.`employee_id`
WHERE p.`project_id` IS NULL
ORDER BY `employee_id` DESC
LIMIT 3;

# 06. Employees Hired After
SELECT e.`first_name`, e.`last_name`, e.`hire_date`, d.`name` AS `dept_name`
FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE e.`hire_date` > '1999-01-01'AND d.`name` IN ('Sales', 'Finance')
ORDER BY e.`hire_date` ASC;

# 07. Employees with Project
SELECT e.`employee_id`, e.`first_name`, p.`name` AS `project_name`
FROM `employees` AS e
JOIN `employees_projects` AS ep 
ON e.`employee_id`= ep.`employee_id`
JOIN `projects` AS p
ON p.`project_id`= ep.`project_id`
WHERE DATE(p.`start_date`) > '2002-08-13' AND p.`end_date` IS NULL
ORDER BY e.`first_name`, p.`name` ASC
LIMIT 5;

# 07. Employees with Project (2)
SELECT e.`employee_id`, e.`first_name`, p.`name`
FROM `employees` AS e
JOIN `employees_projects` AS ep USING (`employee_id`)
JOIN `projects` AS p USING (`project_id`)
WHERE DATE(p.`start_date`) > '2002-08-13' AND p.`end_date` IS NULL
ORDER BY e.`first_name`, p.`name`
LIMIT 5;


# 08. Employee 24
SELECT e.`employee_id`, e.`first_name`,
CASE 
	WHEN DATE(p.`start_date`) <= '2004-12-31' THEN p.`name`
	ELSE NULL
END AS `project_name`
FROM `employees` AS e
JOIN `employees_projects` AS ep
ON e.`employee_id` = ep.`employee_id`
JOIN `projects` AS p
ON p.`project_id` = ep.`project_id`
WHERE e.`employee_id` = 24
ORDER BY p.`name`;


# 08. Employee 24 (2)
SELECT e.`employee_id`, e.`first_name`, 
IF(YEAR(p.`start_date`) >= '2005', NULL, p.`name`) AS `project_name`
FROM `employees` AS e
JOIN `employees_projects` AS ep ON e.`employee_id`= ep.`employee_id`
JOIN `projects` AS p ON p.`project_id`= ep.`project_id`
WHERE e.`employee_id` = 24
ORDER BY p.`name`;


# 09. Employee Manager
SELECT e.`employee_id`, e.`first_name`, e.`manager_id`, m.`first_name`
FROM `employees` AS e
JOIN `employees` AS m ON  e.`manager_id` = m.`employee_id`
WHERE e.`manager_id` IN (3,7)
ORDER BY e.`first_name`;


# 10. Employee Summary
SELECT e.`employee_id`, CONCAT_WS(' ', e.`first_name`, e.`last_name`) AS `employee_name`,
 CONCAT_WS(' ',m.`first_name`, m.`last_name`) AS `manager_name`,
 d.`name` AS `department_name`
FROM `employees` AS e
JOIN `employees` AS m ON e.`manager_id` = m.`employee_id`
JOIN `departments` AS d ON d.`department_id` = e.`department_id`
ORDER BY e.`employee_id`
LIMIT 5;


# 11. Min Average Salary
SELECT AVG(`salary`) AS `min_average_salary` FROM `employees`
GROUP BY `department_id`
ORDER BY `min_average_salary`
LIMIT 1;


# 12. Highest Peaks in Bulgaria
SELECT mc.`country_code`, m.`mountain_range`, p.`peak_name`, p.`elevation`
FROM `peaks` AS p
JOIN `mountains` AS m ON p.`mountain_id` = m.`id`
JOIN `mountains_countries` AS mc ON mc.`mountain_id` = m.`id` 
WHERE mc.`country_code` = 'BG' AND p.`elevation` > 2835
ORDER BY p.`elevation` DESC;


# 13. Count Mountain Ranges
SELECT mc.`country_code`, COUNT(m.`mountain_range`) AS `mountain_range_count`
FROM `mountains` AS m
JOIN `mountains_countries` AS mc
ON m.`id` = mc.`mountain_id`
WHERE mc.`country_code` IN ('BG', 'US', 'RU')
GROUP BY mc.`country_code`
ORDER BY `mountain_range_count` DESC;


# 14. Countries with Rivers
SELECT c.`country_name`, r.`river_name`
FROM `countries` AS c
LEFT JOIN `countries_rivers` AS cr ON c.`country_code`= cr.`country_code`
LEFT JOIN `rivers` AS r ON r.`id`= cr.`river_id`
WHERE c.`continent_code` = 'AF'
ORDER BY c.`country_name`
LIMIT 5;


#15. Continents and Currencies
SELECT `continent_code`, `currency_code`, COUNT(`currency_code`) AS `currency_usage`
FROM `countries` c1
GROUP BY `continent_code`, `currency_code`
HAVING `currency_usage` = (
  SELECT COUNT(`currency_code`) AS `count`
    FROM `countries` c2
    WHERE c2.`continent_code` = c1.`continent_code`
    GROUP BY c2.`currency_code`
    ORDER BY `count` DESC
    LIMIT 1
  ) AND `currency_usage` > 1
ORDER BY `continent_code`, `currency_code`;


# 16. Countries without any Mountains
SELECT COUNT(c.`country_code`) AS `country_count`
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc
ON mc.`country_code` = c.`country_code`
WHERE mc.`mountain_id` IS NULL;


# 17. Highest Peak and Longest River by Country
SELECT `country_name`,
    (
    SELECT MAX(p.`elevation`)
    FROM `mountains_countries`
    LEFT JOIN `peaks` AS p USING (`mountain_id`)
    WHERE `country_code` = c.`country_code`
    ) AS `highest_peak_elevation`,
    (
    SELECT MAX(r.`length`)
    FROM `countries_rivers` AS cr
    LEFT JOIN `rivers` AS r 
    ON cr.`river_id` = r.`id`
    WHERE `country_code` = c.`country_code`
    ) AS `longest_river_length`
    
FROM `countries` AS c
ORDER BY `highest_peak_elevation` DESC, `longest_river_length` DESC, `country_name`
LIMIT 5;



