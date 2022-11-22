package com.example.jsonadvanced.domain.dtos.users;

import com.example.jsonadvanced.domain.dtos.products.ProductDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;

import static com.example.jsonadvanced.domain.dtos.products.ProductDto.toProductsSoldWithCountDto;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDto {

    private String firstName;

    private String lastName;

    private Integer age;

    private Set<ProductDto> sellingProducts;

    private Set<ProductDto> boughtProducts;

    private Set<UserDto> friends;

    public String getFullName() {
        return firstName + " " + lastName;
    }

    public UserWithProductsDto toUserWithProductsDto() {
        return new UserWithProductsDto(firstName, lastName, age, toProductsSoldWithCountDto(sellingProducts));
    }
}
