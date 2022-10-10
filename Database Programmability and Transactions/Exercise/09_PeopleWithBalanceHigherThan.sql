# 9. People with Balance Higher Than 
DELIMITER ##
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(searched_money INT)
BEGIN
SELECT ah.`first_name`, ah.`last_name` FROM `account_holders` AS ah
LEFT JOIN `accounts` AS a ON ah.`id` = a.`account_holder_id`
GROUP BY ah.`first_name`, ah.`last_name`
HAVING SUM(a.`balance`) > searched_money
ORDER BY a.`account_holder_id`;
END ##
