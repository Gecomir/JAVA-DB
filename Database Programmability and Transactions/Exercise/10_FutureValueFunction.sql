# 10. Future Value Function
DELIMITER ##
CREATE FUNCTION ufn_calculate_future_value(sum DECIMAL(19,4), yearly_rate DOUBLE, number_of_years INT )
RETURNS DECIMAL(19,4)
DETERMINISTIC
BEGIN	
	DECLARE future_sum DECIMAL(19,4);
    SET future_sum := sum * POW(1+ yearly_rate, number_of_years);
    RETURN future_sum;
END ##