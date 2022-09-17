ALTER TABLE `products` 
ADD CONSTRAINT `fk_id_p_c`
 FOREIGN KEY `products` (`category_id`)
 REFERENCES `categories` (`id`);