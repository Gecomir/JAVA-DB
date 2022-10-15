# 10. Extract Bill
DELIMITER ##
CREATE FUNCTION udf_client_bill (full_name VARCHAR(50))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
RETURN (SELECT SUM(p.`price`) FROM `products` AS p
JOIN `orders_products` AS op ON p.`id` = op.`product_id`
JOIN `orders` AS o ON o.`id` = op.`order_id`
JOIN `orders_clients` AS oc ON o.`id` = oc.`order_id`
JOIN `clients` AS c ON c.`id` = oc.`client_id`
WHERE CONCAT(c.`first_name`, ' ', c.`last_name`) = full_name);
END ##

# 11. Happy hour
DELIMITER ##
CREATE PROCEDURE udp_happy_hour (type VARCHAR(50))
BEGIN
UPDATE `products` AS p
SET p.`price` = `price` * 0.8
WHERE p.`type` = type AND p.`price` >= 10;
END ##
