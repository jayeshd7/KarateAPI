
Feature: test the get api

Background:
    * def appUrl = read('../../resources\\applicationurl.json')
    * def pageNum = envPageNum

    * def getRandomPwd = Java.type('examples.utils.RandomPwd')
    * def registerBody = read('../../resources\\requestBodyRegisterUser.json')
    * def getSchema = read('../../resources\\schemaGetUser.json')


@finalTest
Scenario:
    * def registerPwd = getRandomPwd.passwordGenerator();
    
    Given url appUrl.applicationUrl
    And path '/api/users'
    And param page = pageNum
    When method GET
    Then status 200
    And def michaelId = response.data[0].id
    And def michaelEmail = response.data[0].email
    And match response == getSchema.schemaOne
    And path '/api/register'
    And set registerBody.email = michaelEmail
    And set registerBody.password = registerPwd
    And request  registerBody
    When method POST 
    Then status 200
    Then match response.id == michaelId
    And def registerToken = response.token
    And path '/api/login'    
    And set registerBody.email = michaelEmail
    And set registerBody.password = registerPwd
    And request registerBody
    When method POST
    Then status 200
    And def loginToken = response.token
    * def tokenCompare = getRandomPwd.tokenCompare(loginToken, registerToken)
    * print 'tokenCompare', tokenCompare
    And match tokenCompare == true
    

