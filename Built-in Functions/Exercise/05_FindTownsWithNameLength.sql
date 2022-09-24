# 05. Find Towns with Name Length
SELECT `name` FROM `towns`
WHERE char_length(`name`) = 5 OR char_length(`name`) = 6
# WHERE char_lenght(`name`) IN (5, 6)
ORDER BY `name`;

