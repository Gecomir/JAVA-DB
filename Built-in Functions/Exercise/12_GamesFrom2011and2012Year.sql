# 12. Games from 2011 and 2012 Year
SELECT `name`, DATE_FORMAT(`start`, '%Y-%m-%d') AS `start` FROM `games`
WHERE YEAR(`start`) IN (2011, 2012)
#WHERE YEAR(`start`) BETWEEN 2011 AND 2012
ORDER BY `start`, `name`
LIMIT 50;
