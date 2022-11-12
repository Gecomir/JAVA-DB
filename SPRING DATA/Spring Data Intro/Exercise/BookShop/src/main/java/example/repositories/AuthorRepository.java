package com.example.bookshop.repositories;

import com.example.bookshop.domain.entities.Author;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface AuthorRepository extends JpaRepository<Author, Integer> {
    List<Author> findDistinctByBooksReleaseDateBefore(LocalDate releaseDate);

    Author findByFirstNameAndLastName(String firstName, String lastName);
}
