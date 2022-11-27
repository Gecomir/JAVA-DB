package com.example.jsonadvanced.services;

import com.example.jsonadvanced.domain.dtos.categories.CategoryProductSummaryDto;
import com.example.jsonadvanced.repositories.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.NoSuchElementException;

import static com.example.jsonadvanced.constant.Paths.CATEGORIES_BY_PRODUCTS_XML_PATH;
import static com.example.jsonadvanced.constant.Utils.writeJsonToFile;

@Service
public class CategoryServiceImpl implements CategoryService{
    private final CategoryRepository categoryRepository;

    @Autowired
    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<CategoryProductSummaryDto> getCategorySummary() throws IOException {

        final List<CategoryProductSummaryDto> categoryProductSummaryDtos = this.categoryRepository.getCategorySummary().orElseThrow(NoSuchElementException::new);

        writeJsonToFile(categoryProductSummaryDtos, CATEGORIES_BY_PRODUCTS_XML_PATH);

        return categoryProductSummaryDtos;
    }
}
