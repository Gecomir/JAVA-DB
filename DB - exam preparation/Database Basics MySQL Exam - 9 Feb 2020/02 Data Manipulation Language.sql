# 02. INSERT
INSERT INTO `coaches` (`first_name`, `last_name`, `salary`, `coach_level`)
SELECT p.`first_name`, p.`last_name`, p.`salary`, CHAR_LENGTH(p.`first_name`) 
FROM `players` AS p
WHERE p.`age` >= 45;

# 03. UPDATE
UPDATE `coaches` AS c
SET c.`coach_level` = c.`coach_level` + 1
WHERE c.`id` IN (SELECT `coach_id` FROM `players_coaches`) 
AND c.`first_name` LIKE 'A%';

# 04. DELETE
DELETE FROM `players`
WHERE age >=45;
