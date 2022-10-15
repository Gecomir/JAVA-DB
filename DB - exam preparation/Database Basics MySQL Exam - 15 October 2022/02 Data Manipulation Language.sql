# 02. INSERT
INSERT INTO `products` (`name`,`type`,`price`)
SELECT CONCAT(`last_name`,'','specialty'),'Cocktail', CEIL(w.`salary` * 0.01)
FROM `waiters`
WHERE `id` > 6;

# 03. UPDATE
UPDATE `orders`
SET `table_id` = `table_id` - 1
WHERE `id` BETWEEN 12 AND 23;


# 04. DELETE
DELETE w FROM `waiters` AS w
JOIN `orders` AS o ON w.`id` = o.`waiter_id`
WHERE o.`id` IS NULL;
