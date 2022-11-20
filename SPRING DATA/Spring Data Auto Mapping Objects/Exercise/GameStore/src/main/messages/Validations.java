package com.softuni.gamestore.messages;

public enum Validations {
;
    public static final String EMAIL_REGEX = "^([a-zA-Z0-9_\\-\\.]+)@([a-zA-Z0-9_\\-\\.]+)\\.([a-zA-Z]{2,5})$";
    public static final String PASSWORD_REGEX = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$";

    public static final String INVALID_EMAIL = "Incorrect email.";
    public static final String INCORRECT_USERNAME_OR_PASSWORD = "Incorrect username / password!";
    public static final String PASSWORDS_MISS_MATCH = "Passwords are not matching!";

    public static final String COMMAND_NOT_FOUND = "Command not found!";
}
