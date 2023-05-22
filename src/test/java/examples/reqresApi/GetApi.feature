Feature: Sample Get Api Test

  Background:
    * url 'https://reqres.in'

  Scenario: Test a sample GET Api
    Given path 'api/users?page=2'
    When method get
    Then status 200