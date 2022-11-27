package com.example.jsonadvanced.services;

import com.example.jsonadvanced.domain.dtos.products.ExportProductsInRangeDto;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

public interface ProductService {

    ExportProductsInRangeDto getInRange(float from, float to);
}
