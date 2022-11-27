package com.example.jsonadvanced.repositories;

import com.example.jsonadvanced.domain.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    @Query("SELECT u FROM User u" +
            " WHERE " +
            "   (SELECT COUNT(p) " +
            "    FROM Product p " +
            "    WHERE p.seller = u AND p.buyer IS NOT NULL) > 0" +
            " ORDER BY u.lastName, u.firstName")
    List<User> findAllWithSoldProducts();

    @Query("SELECT u FROM User u" +
            " WHERE " +
            "   (SELECT COUNT(p) " +
            "    FROM Product p " +
            "    WHERE p.seller = u AND p.buyer IS NOT NULL) > 0")
    List<User> findAllWithSoldProductsOrderByCount();
}
