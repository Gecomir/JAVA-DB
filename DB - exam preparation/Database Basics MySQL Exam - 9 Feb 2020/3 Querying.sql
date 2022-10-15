# 05. Players
SELECT `first_name`, `age`,`salary` FROM `players`
ORDER BY `salary` DESC;

# 06. Young offense players without contract
SELECT p.`id`, CONCAT_WS(' ', p.`first_name`, p.`last_name`) AS `full_name`, p.`age`, p.`position`, p.`hire_date`
FROM `players` AS p
JOIN `skills_data` AS sd ON sd.`id`= p.`skills_data_id`
WHERE `hire_date` IS NULL AND `position` LIKE 'A' AND sd.`strength` > 50
ORDER BY p.`salary` ASC, p.`age`;

# 07. Detail info for all teams
SELECT t.`name` AS `team_name`, t.`established`, t.`fan_base`, 
	(SELECT count(`id`) FROM `players` AS p
		WHERE p.`team_id` = t.`id`) AS `players_count`
FROM `teams` AS t
ORDER BY `players_count` DESC, `fan_base` DESC;

# 08. The fastest player by towns
SELECT max(sd.speed) AS max_speed, t.`name`
FROM players AS p
	RIGHT JOIN skills_data AS sd
    	ON p.skills_data_id = sd.id
    	RIGHT JOIN teams AS te
    	ON p.team_id = te.id
    	RIGHT JOIN stadiums AS s
    	ON te.stadium_id = s.id
    	RIGHT JOIN towns AS t
    	ON s.town_id = t.id
WHERE te.`name` NOT LIKE 'Devify'
GROUP BY t.`name`
ORDER BY max_speed DESC, t.`name`;

# 09. Total salaries and players by country
SELECT c.`name`, count(p.`id`) AS total_count_of_players, sum(p.`salary`) AS total_sum_of_salaries
FROM players AS p
RIGHT JOIN `skills_data` AS sd ON p.`skills_data_id` = sd.id
RIGHT JOIN `teams` AS te ON p.`team_id` = te.`id`
RIGHT JOIN `stadiums` AS s ON te.`stadium_id` = s.`id`
RIGHT JOIN `towns` AS t ON s.`town_id` = t.`id`
RIGHT JOIN `countries` AS c ON t.`country_id` = c.`id`
GROUP BY c.`name`
ORDER BY total_count_of_players DESC, c.`name`;