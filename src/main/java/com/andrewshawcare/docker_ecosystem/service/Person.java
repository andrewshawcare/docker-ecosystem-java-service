package com.andrewshawcare.docker_ecosystem.service;

public class Person {
  private final int id;
  private final String name;

  public Person (final int id, final String name) {
    this.id = id;
    this.name = name;
  }

  public final int getId() {
    return this.id;
  }

  public final String getName() {
    return this.name;
  };
}
