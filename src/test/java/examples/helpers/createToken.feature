Feature: create token helper

Scenario: token for all api
    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response