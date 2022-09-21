USE `soft_uni`;
#19. Last 7 Hired Employees;
SELECT `first_name`, `last_name`, `hire_date` from `employees`
ORDER BY `hire_date` DESC
LIMIT 7;
