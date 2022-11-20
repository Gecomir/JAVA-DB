package com.softuni.gamestore.dtos;

import com.softuni.gamestore.domain.entities.User;

import java.util.regex.Pattern;

import static com.softuni.gamestore.messages.Validations.*;

public class UserRegisterDTO {

    private String email;

    private String password;

    private String confirmPassword;

    private String fullName;

    public UserRegisterDTO() {

    }

    public UserRegisterDTO(String email, String password, String confirmPassword, String fullName) {
        this.email = email;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.fullName = fullName;
        validate();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    private void validate() throws IllegalArgumentException {
        final boolean isEmailValid = Pattern.matches(EMAIL_REGEX, this.email);

        if (!isEmailValid) {
            throw new IllegalArgumentException(INVALID_EMAIL);
        }

        final boolean isPasswordValid = Pattern.matches(PASSWORD_REGEX, this.password);

        if (!isPasswordValid) {
            throw new IllegalArgumentException(INCORRECT_USERNAME_OR_PASSWORD);
        }

        if (!password.equals(confirmPassword)) {
            throw new IllegalArgumentException(PASSWORDS_MISS_MATCH);
        }
    }

    public User toUser() {
        return new User(email, password, fullName);
    }

    public String successfulRegisterFormat() {
        return fullName + " was registered";
    }
}
