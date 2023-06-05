
Feature: test the get api

Background:
    * def appUrl = read('../../resources\\applicationurl.json')
    * def pageNum = envPageNum

@finalTest
Scenario:
    Given url appUrl.applicationUrl
    And path '/api/users'
    And param page = pageNum
    When method GET
    Then status 200
    And match response.page == pageNum
    
Scenario Outline: test api with multiple pages
    * def quaryParams = {page:<page_num>}
    Given url appUrl.applicationUrl
    And path '/api/users'
    And params quaryParams
    When method GET
    Then status 200
    And match response.page == <page_num>
    Examples:
    |page_num|
    |1|
    |2|