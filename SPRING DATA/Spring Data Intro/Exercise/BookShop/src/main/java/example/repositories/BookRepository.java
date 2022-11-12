package com.example.bookshop.repositories;

import com.example.bookshop.domain.entities.Author;
import com.example.bookshop.domain.entities.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface BookRepository extends JpaRepository<Book, Integer> {
    List<Book> findByReleaseDateAfter(LocalDate releaseDate);

    List<Book> findByAuthorOrderByReleaseDateDescTitleAsc(Author author);
}
