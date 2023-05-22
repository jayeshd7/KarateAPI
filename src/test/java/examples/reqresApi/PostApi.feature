Feature: Sample Post Api Test

  Background:
    * url 'https://reqres.in'

  Scenario: Test a sample POST Api
    * def user =


      """{
        "name": "morpheus",
        "job": "leader"
        }
      """

    Given path '/api/users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id