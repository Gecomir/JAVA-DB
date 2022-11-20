package com.softuni.gamestore.services.user;

import com.softuni.gamestore.domain.entities.User;
import com.softuni.gamestore.dtos.UserLoginDTO;
import com.softuni.gamestore.dtos.UserRegisterDTO;
import com.softuni.gamestore.repositories.UserRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

import static com.softuni.gamestore.messages.Validations.INCORRECT_USERNAME_OR_PASSWORD;

@Service
public class UserServiceImpl implements UserService {
    private User loggedInUser;

    private final UserRepository userRepository;
    private final ModelMapper modelMapper = new ModelMapper();

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public String registerUser(String[] args) {
        final String email = args[1];
        final String password = args[2];
        final String confirmPassword = args[3];
        final String fullName = args[4];

        UserRegisterDTO userRegisterDTO;

        try {
            userRegisterDTO = new UserRegisterDTO(email, password, confirmPassword, fullName);
        } catch (IllegalArgumentException exception) {
            return exception.getMessage();
        }

        final User user = this.modelMapper.map(userRegisterDTO, User.class);

        if (this.userRepository.count() == 0) {
            user.setIsAdmin(true);
        }

        boolean doesUserExists = this.userRepository.findFirstByEmail(userRegisterDTO.getEmail()).isPresent();

        if (doesUserExists) {
            return "Email already exists";
        }

        this.userRepository.save(user);

        return userRegisterDTO.successfulRegisterFormat();
    }

    @Override
    public String loginUser(String[] args) {
        final String email = args[1];
        final String password = args[2];

        final UserLoginDTO userLoginDTO = new UserLoginDTO(email, password);

        Optional<User> user = this.userRepository.findFirstByEmail(userLoginDTO.getEmail());

        if (user.isPresent() &&
                this.loggedInUser == null &&
                user.get().getPassword().equals(userLoginDTO.getPassword())) {
            this.loggedInUser = this.userRepository.findFirstByEmail(userLoginDTO.getEmail()).get();
            return "Successfully logged in " + this.loggedInUser.getFullName();
        }

        return INCORRECT_USERNAME_OR_PASSWORD;
    }

    @Override
    public String logoutUser() {
        if (this.loggedInUser == null) {
            return "Cannot log out. No user was logged in.";
        }

        String output = "User " + this.loggedInUser.getFullName() + " successfully logged out";

        this.loggedInUser = null;

        return output;
    }

    @Override
    public User getLoggedInUser() {
        return this.loggedInUser;
    }
}
