Feature: Invocation of the deployed function
  The image under test runs as a deployed function (the test environment).
  The function is invoked directly through the Lambda API, whatever its triggers are.

  Scenario: An event is processed
    When the function is invoked with {"key": "value"}
    Then the invocation succeeds
    And the result is {"status": "ok"}
