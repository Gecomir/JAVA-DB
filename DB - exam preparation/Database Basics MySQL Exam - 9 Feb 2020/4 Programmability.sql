# 10. Find all players that play on stadium
DELIMITER ##
CREATE FUNCTION udf_stadium_players_count (stadium_name VARCHAR(30))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE count INT;
	SET count := (
		SELECT count(p.`id`)
		FROM `stadiums` AS s
		JOIN `teams` AS t
		ON t.`stadium_id` = s.`id`
        JOIN `players` AS p
        ON p.`team_id` = t.`id`
        WHERE s.`name` = stadium_name
        );
  	RETURN count;
END ##

# 11. Find good playmaker by teams
DELIMITER ##
CREATE PROCEDURE `udp_find_playmaker` (min_dribble_points INT, team_name VARCHAR(45))
BEGIN
SELECT 
    CONCAT(p.`first_name`, ' ', p.`last_name`) AS `full_name`,
    p.`age`, p.`salary`, sk.`dribbling`, sk.`speed`, tm.`name`
FROM `players` AS p
JOIN `skills_data` AS sk ON p.`skills_data_id` = sk.`id`
JOIN `teams` AS tm ON p.`team_id` = tm.`id`
JOIN `stadiums` AS st ON tm.`stadium_id` = st.`id`
JOIN `towns` AS t ON st.`town_id` = t.`id`
WHERE sk.`dribbling` > min_dribble_points AND tm.`name` = team_name AND sk.`speed` > 
		(SELECT AVG(`speed`) 
        FROM `skills_data`)
ORDER BY sk.`speed` DESC
LIMIT 1;
END ##
