# 06. Old movies
SELECT m.`id`, m.`title`, mai.`runtime`, mai.`budget`, mai.`release_date`
FROM `movies_additional_info` AS mai
JOIN `movies` AS m USING (`id`)
WHERE year(`release_date`) BETWEEN 1996 AND 1999
ORDER BY `runtime`,`id`
LIMIT 20;