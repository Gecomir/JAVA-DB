# 08. International festival
SELECT c.`name`, COUNT(m.`id`) AS `movies_count`
FROM `movies` AS m
LEFT JOIN `countries` AS c 
ON m.`country_id` = c.`id`
GROUP BY m.`country_id`
HAVING `movies_count` >= 7
ORDER BY c.`name` DESC;