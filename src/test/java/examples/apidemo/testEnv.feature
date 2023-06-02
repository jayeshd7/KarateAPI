
@envTest
Feature: verify the env concept.

Background: 
    Given url baseUrl
    * def pageNum = envPageNum
    * def registerBody = envRegisterbody


Scenario: Test the api to get the list of users.
    Given path '/api/users'
    And param page = pageNum
    When method GET
    Then status 200
    And print response

Scenario: register user with env variable
    And path '/api/register'
    And request registerBody
    When method post
    Then status 200
