# 16. Countries without any Mountains
SELECT COUNT(c.`country_code`) AS `country_count`
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc
ON mc.`country_code` = c.`country_code`
WHERE mc.`mountain_id` IS NULL;

# 16. Countries without any Mountains (2)
SELECT COUNT(c.`country_code`)
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc USING (`country_code`)
WHERE mc.`mountain_id` IS NULL;

