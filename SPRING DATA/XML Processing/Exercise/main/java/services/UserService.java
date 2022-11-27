package com.example.jsonadvanced.services;

import com.example.jsonadvanced.domain.dtos.users.ExportSellersDTO;
import com.example.jsonadvanced.domain.dtos.users.ExportSellersWithCountsDTO;



public interface UserService {
    ExportSellersDTO findAllWithSoldProducts();

    ExportSellersWithCountsDTO findAllWithSoldProductsAndCounts();
}
