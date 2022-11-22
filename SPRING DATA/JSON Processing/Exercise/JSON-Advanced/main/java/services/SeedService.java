package com.example.jsonadvanced.services;



import org.springframework.stereotype.Service;

import java.io.IOException;


@Service
public interface SeedService {
    void seedUsers() throws IOException;

    void seedCategories() throws IOException;

    void seedProducts() throws IOException;

    default void seedAll() throws IOException {
        seedUsers();
        seedCategories();
        seedProducts();
    }
}
