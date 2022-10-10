# 11. Calculating Interest
DELIMITER ##
CREATE FUNCTION ufn_calculate_future_value(sum DECIMAL(19,4), yearly_rate DOUBLE, number_of_years INT )
RETURNS DECIMAL(19,4)
DETERMINISTIC
BEGIN	
	DECLARE future_sum DECIMAL(19,4);
    SET future_sum := sum * POW(1+ yearly_rate, number_of_years);
    RETURN future_sum;
END ##

DELIMITER ##
CREATE PROCEDURE usp_calculate_future_value_for_account(id INT, interest_rate DECIMAL(19,4))
BEGIN
    SELECT a.`id` AS 'account_id', ah.`first_name`, ah.`last_name`, 
    a.`balance` AS 'current_balance',
    ufn_calculate_future_value(a.balance, interest_rate, 5) AS 'balance_in_5_years'
    FROM `account_holders` AS ah
    JOIN `accounts` AS a ON a.`account_holder_id` = ah.`id`
    WHERE a.`id` = id;
END ##