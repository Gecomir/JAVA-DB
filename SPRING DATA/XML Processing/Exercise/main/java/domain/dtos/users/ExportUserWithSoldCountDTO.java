package com.example.jsonadvanced.domain.dtos.users;

import com.example.jsonadvanced.domain.dtos.products.ExportSoldProductsDTO;

public class ExportUserWithSoldCountDTO {
    private String firstName;
    private String lastName;
    private int age;

    private ExportSoldProductsDTO soldProducts;

    public ExportUserWithSoldCountDTO() {}

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public void setSoldProducts(ExportSoldProductsDTO soldProducts) {
        this.soldProducts = soldProducts;
    }
}
