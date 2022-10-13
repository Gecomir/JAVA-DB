# 07. Movie casting
SELECT 
	concat_ws(' ', `first_name`, `last_name`) AS `full_name`, 
	concat(reverse(`last_name`), length(`last_name`), '@cast.com') AS `email`,
	2022 - year(`birthdate`) AS `age`, `height`
FROM `actors`
LEFT JOIN `movies_actors` AS m 
ON `id` = m.`actor_id`
WHERE `actor_id` IS NULL
ORDER BY `height`;