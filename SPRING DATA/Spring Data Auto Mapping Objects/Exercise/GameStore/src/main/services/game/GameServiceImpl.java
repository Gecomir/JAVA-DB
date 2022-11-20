package com.softuni.gamestore.services.game;

import com.softuni.gamestore.domain.entities.Game;
import com.softuni.gamestore.dtos.GameDTO;
import com.softuni.gamestore.repositories.GameRepository;
import com.softuni.gamestore.services.user.UserService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;
import java.time.LocalDate;

public class GameServiceImpl implements GameService{

    private final ModelMapper modelMapper = new ModelMapper();

    private final GameRepository gameRepository;
    private final UserService userService;

    @Autowired
    public GameServiceImpl(GameRepository gameRepository, UserService userService) {
        this.gameRepository = gameRepository;
        this.userService = userService;
    }

    @Override
    public String addGame(String[] args) {
        if (this.userService.getLoggedInUser() != null && this.userService.getLoggedInUser().getIsAdmin()) {

            final String title = args[1];

            final BigDecimal price = new BigDecimal(args[2]);

            final float size = Float.parseFloat(args[3]);

            final String trailer = args[4];

            final String imageUrl = args[5];

            final String description = args[6];

            final LocalDate releaseDate = LocalDate.now();

            final GameDTO gameDTO = new GameDTO(title, trailer, imageUrl, size, price, description, releaseDate);

            final Game gameToSave = gameDTO.toGame();

            this.gameRepository.save(gameToSave);

            return "Added " + title;
        }

        return "Impossible command";
    }

    @Override
    public String editGame(String[] args) {
        return null;
    }

    @Override
    public String deleteGame(Long id) {
        return null;
    }

}
