# 03. Town Names Starting With
DELIMITER ##
CREATE PROCEDURE usp_get_towns_starting_with (`started_with` VARCHAR(50))
BEGIN
SELECT `name` FROM `towns`
WHERE `name` LIKE CONCAT(started_with, '%')
ORDER BY `name`;
END ##
