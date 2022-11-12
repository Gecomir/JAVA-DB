package com.example.bookshop.domain.services.categoryService;

import com.example.bookshop.domain.entities.Category;

import java.util.Set;

public interface CategoryService {
    Set<Category> getRandomCategories();
}
