package com.example.jsonadvanced.domain.dtos.users;

import com.example.jsonadvanced.domain.dtos.products.ProductsSoldWithCountDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserWithProductsDto {

    private String firstName;

    private String lastName;

    private Integer age;

    private ProductsSoldWithCountDto products;
}
