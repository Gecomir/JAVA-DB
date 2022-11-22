package com.example.jsonadvanced.services;

import com.example.jsonadvanced.domain.dtos.users.UsersWithProductsWrapperDto;
import com.example.jsonadvanced.domain.dtos.users.UsersWithSoldProductsDto;

import javax.xml.bind.JAXBException;
import java.io.IOException;
import java.util.List;

public interface UserService {
    List<UsersWithSoldProductsDto> findAllByOrderByLastNameAscFirstNameAsc() throws IOException;

    UsersWithProductsWrapperDto usersWithProducts() throws IOException;
}
