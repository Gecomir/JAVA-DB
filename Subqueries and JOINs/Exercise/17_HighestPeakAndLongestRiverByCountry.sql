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
