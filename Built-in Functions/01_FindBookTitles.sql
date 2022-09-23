SELECT `title` FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = 'The';

SELECT `title` FROM `books`
WHERE LOCATE('The', `title`) = 1; 