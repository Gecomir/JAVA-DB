# 7. Find Towns Not Starting With
SELECT * FROM `towns`
#WHERE `name`  NOT LIKE 'R%' AND `name` NOT LIKE 'B%' AND `name`  NOT LIKE 'D%' 
WHERE `name`  NOT REGEXP '^[RBD]'
ORDER BY `name`;