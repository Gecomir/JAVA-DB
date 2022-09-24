# 6. Find Towns Starting With
SELECT * FROM `towns`
#WHERE `name` LIKE 'M%' OR `name` LIKE 'K%' OR `name` LIKE 'B%' OR `name` LIKE 'E%'
WHERE `name` REGEXP '^[MKBE]'
ORDER BY `name`;