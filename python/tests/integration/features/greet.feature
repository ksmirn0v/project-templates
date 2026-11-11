Feature: Greeting
  A name is turned into a greeting.

  Scenario: A name is greeted
    Given the name "Ada"
    When the greeting is requested
    Then the greeting is "Hello, Ada!"

  Scenario: Whitespace around the name is ignored
    Given the name "  Ada "
    When the greeting is requested
    Then the greeting is "Hello, Ada!"

  Scenario: An empty name is rejected
    Given the name " "
    When the greeting is requested
    Then the request fails with "name must not be empty"
