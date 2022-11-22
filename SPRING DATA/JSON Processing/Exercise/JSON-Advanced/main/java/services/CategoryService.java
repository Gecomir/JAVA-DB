package com.example.jsonadvanced.services;

import com.example.jsonadvanced.domain.dtos.categories.CategoryProductSummaryDto;

import java.io.IOException;
import java.util.List;

public interface CategoryService {

    List<CategoryProductSummaryDto> getCategorySummary() throws IOException;
}
