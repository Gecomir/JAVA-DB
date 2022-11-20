package com.softuni.gamestore.services.game;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

@Service
public interface GameService {
    String addGame(String[] args);

    String editGame(String[] args);

    String deleteGame(Long id);
}
