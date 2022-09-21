USE `soft_uni`;
#18. Find First 10 Started Projects
SELECT * FROM `projects`
ORDER BY `start_date`, `name`, `project_id`
LIMIT 10;