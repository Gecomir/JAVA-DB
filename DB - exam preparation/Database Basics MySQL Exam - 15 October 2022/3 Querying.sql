# 05. Clients
SELECT * FROM `clients`
ORDER BY `birthdate` DESC, `id` DESC;

# 06. Birthdate
SELECT c.`first_name`, c.`last_name`, c.`birthdate`, c.`review`
FROM `clients` AS c
WHERE c.`card` IS NULL AND YEAR(c.`birthdate`) BETWEEN '1978' AND '1993'
ORDER BY c.`last_name` DESC, c.`id`
LIMIT 5;

# 07. Accounts
SELECT CONCAT(`last_name`, `first_name`,CHAR_LENGTH(`first_name`),'Restaurant') AS `username`, 
REVERSE(SUBSTR(`email`, 2, 12 )) AS `password`
FROM `waiters`
WHERE `salary` IS NOT NULL
ORDER BY `password` DESC;

# 08. Top from menu
SELECT p.`id`,  p.`name`, COUNT(p.`id`) AS `count`
FROM `products` AS p
JOIN `orders_products` AS op ON p.`id` = op.`product_id`
GROUP BY p.`name`
HAVING `count` >=5
ORDER BY `count` DESC, p.`name` ASC;

# 09. Availability
SELECT o.`table_id`, t.`capacity`, COUNT(c.`id`) AS `count_clients`,
	CASE 
    WHEN t.capacity > COUNT(c.`id`) THEN 'Free seats'
    WHEN t.capacity = COUNT(c.`id`) THEN 'Full'
    ELSE 'Extra seats'
    END AS `availability`
FROM `tables` as t
JOIN orders AS o ON t.`id` = o.`table_id`
JOIN `orders_clients` AS oc ON o.`id` = oc.`order_id`
JOIN `clients` AS c ON oc.`client_id` = c.`id`
WHERE t.`floor` = 1
GROUP BY o.`table_id`
ORDER BY o.`table_id` DESC;