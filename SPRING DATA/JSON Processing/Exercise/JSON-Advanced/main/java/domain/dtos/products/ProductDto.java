package com.example.jsonadvanced.domain.dtos.products;

import com.example.jsonadvanced.domain.dtos.categories.CategoryDto;
import com.example.jsonadvanced.domain.dtos.users.UserDto;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.Set;
import java.util.stream.Collectors;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProductDto {
    private String name;

    private BigDecimal price;

    private UserDto buyer;

    private UserDto seller;

    private Set<CategoryDto> categories;

    public ProductInRangeWithNoBuyerDto toProductInRangeWithNoBuyerDto() {
        return new ProductInRangeWithNoBuyerDto(name, price, seller.getFullName());
    }

    public static ProductsSoldWithCountDto toProductsSoldWithCountDto(Set<ProductDto> sellingProducts) {
        return new ProductsSoldWithCountDto(sellingProducts
                .stream()
                .map(ProductDto::toProductBasicInfo)
                .collect(Collectors.toList()));
    }

    public static ProductBasicInfo toProductBasicInfo(ProductDto productDto) {
        return new ProductBasicInfo(productDto.getName(), productDto.getPrice());
    }
}

