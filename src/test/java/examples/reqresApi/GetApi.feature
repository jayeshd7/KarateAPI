Feature: Sample Get Api Test

  Background:
    * url 'https://reqres.in'

  Scenario: Test a sample GET Api
    * def query = {page:'<pages>'}
    * def values =

    """
    function(o) {
      for (var key in o) {
        if (o[key] == '') o[key] = 2;
      }
      return o;
    }

    """
    * def getResponseParam = read('get-response-param.js')
    * def query = values(query)
    * print query

    Given path 'api/users'
    And  params query
    When method get
    Then status 200