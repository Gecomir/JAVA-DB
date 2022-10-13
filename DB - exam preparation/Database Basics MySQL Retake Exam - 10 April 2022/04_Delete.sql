# 04 DELETE
DELETE c FROM `countries` AS c
LEFT JOIN `movies` AS m ON c.`id` = m.`country_id`
WHERE m.`country_id` IS NULL;

# 04 DELETE
DELETE c FROM `countries`
WHERE `id` NOT IN (SELECT `country_id` FROM `movies`);