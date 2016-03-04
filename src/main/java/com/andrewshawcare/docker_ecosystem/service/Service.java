package com.andrewshawcare.docker_ecosystem.service;

import static spark.Spark.get;
import com.google.gson.Gson;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Service {
  public static void main (final String[] args) {
    final Gson gson = new Gson();

    get("/people", "application/json", (request, response) -> {
      final String url = "jdbc:postgresql://database:5432/postgres";
      final String username = "postgres";
      final String password = "";
      final String statement = "select id, name from person";
      List<Person> people = new ArrayList<>();

      try (
              final Connection connection = DriverManager.getConnection(url, username, password);
              final PreparedStatement preparedStatement = connection.prepareStatement(statement);
      ) {
        try (ResultSet resultSet = preparedStatement.executeQuery();) {
          while (resultSet.next()) {
            people.add(new Person(resultSet.getInt("id"), resultSet.getString("name")));
          }
        }
      } catch (SQLException sqlException) {
        sqlException.printStackTrace();
      }

      response.header("Access-Control-Allow-Origin", "*");
      response.header("Access-Control-Request-Method", "*");
      response.header("Access-Control-Allow-Headers", "*");

      return people;
    }, gson::toJson);
  }
}
