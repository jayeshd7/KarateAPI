Feature: Sample Get Api Test

  Background:
    * url 'https://reqres.in'

  Scenario: Test the api to get the list of users.
    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response