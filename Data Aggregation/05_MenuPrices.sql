# 5. Menu Prices
SELECT `category_id`,
ROUND(AVG(`price`), 2) AS `Average Price`,
ROUND(MIN(`price`), 2) AS `Cheapest Produc`,
ROUND(MAX(`price`), 2) AS `Most Expensive Product`
FROM `products`
GROUP BY `category_id`;
