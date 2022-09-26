# 15. Show All Games with Duration and Part of the Day
SELECT `name` AS `game`,
CASE
WHEN HOUR(`start`) >=0 AND HOUR(`start`) < 12 THEN 'Morning'
WHEN HOUR(`start`) >=12 AND HOUR(`start`) < 16 THEN 'Afternoon'
ELSE 'Evening'
END
AS `Part of the day`,

CASE
WHEN `duration` <=3 THEN 'Extra Short'
WHEN `duration` <=6 THEN 'Short'
WHEN `duration` <=10 THEN 'Long'
ELSE 'Extra Long'
END
AS `Duration`

FROM `games`;