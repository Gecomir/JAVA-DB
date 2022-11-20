package com.softuni.gamestore.services.user;

import com.softuni.gamestore.domain.entities.User;

import java.util.Optional;

public interface UserService {
    String registerUser(String[] args);

    String loginUser(String[] args);

    String logoutUser();

    User getLoggedInUser();
}
