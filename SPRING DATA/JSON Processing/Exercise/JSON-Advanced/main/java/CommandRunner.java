package com.example.jsonadvanced;

import com.example.jsonadvanced.services.CategoryService;
import com.example.jsonadvanced.services.ProductService;
import com.example.jsonadvanced.services.SeedService;
import com.example.jsonadvanced.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.math.BigDecimal;

@Component
public class CommandRunner implements CommandLineRunner {

    private final SeedService seedService;
    private final ProductService productService;
    private final UserService userService;
    private final CategoryService categoryService;

    @Autowired
    public CommandRunner(SeedService seedService, ProductService productService, UserService userService, CategoryService categoryService) {
        this.seedService = seedService;
        this.productService = productService;
        this.userService = userService;
        this.categoryService = categoryService;
    }

    @Override
    @Transactional
    public void run(String... args) throws Exception {
        this.seedService.seedAll();

        this.productService.findAllByPriceBetweenAndBuyerIsNullOrderByPrice(BigDecimal.valueOf(500), BigDecimal.valueOf(1000));

        this.userService.findAllByOrderByLastNameAscFirstNameAsc();

        this.categoryService.getCategorySummary();

        this.userService.usersWithProducts();
    }
}