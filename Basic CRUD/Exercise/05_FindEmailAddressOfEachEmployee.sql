USE `soft_uni`;
# 05. Find Email Address of Each Employee
# email: {first name} . {last name} @softuni.bg
SELECT 
    CONCAT(`first_name`,
            '.',
            `last_name`,
            '@softuni.bg') AS `full_email_address`
FROM `employees`;
