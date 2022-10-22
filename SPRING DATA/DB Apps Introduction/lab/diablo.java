package com.jdbs.demo;

import java.sql.*;
import java.util.Properties;
import java.util.Scanner;

public class diablo {
    public static void main(String[] args) throws SQLException {
        Scanner scanner = new Scanner(System.in);

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "Gecomir1235@");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diablo", properties);

        String username = scanner.nextLine();

        PreparedStatement stmt = connection.prepareStatement(
                "SELECT u.`user_name`, u.`first_name`, u.`last_name`, " +
                        "(SELECT COUNT(*) FROM `users_games` WHERE `user_id` = u.`id`) AS game_count " +
                        "FROM `users` AS u " +
                        "WHERE `user_name` LIKE ?");
        stmt.setString(1, username);

        ResultSet resultSet = stmt.executeQuery();

        if (resultSet.next()) {
            String dbUsername = resultSet.getString("user_name");
            String dbFirstName = resultSet.getString("first_name");
            String dbLastName = resultSet.getString("last_name");
           int dbCount = resultSet.getInt("game_count");

            System.out.printf("User: %s%n%s %s has played %d games", dbUsername, dbFirstName, dbLastName, dbCount);
        } else {
            System.out.println("No such user exists");
        }
    }
}
