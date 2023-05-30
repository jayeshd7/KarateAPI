Feature: test the flow of reqres different api's


Background: 
    * def postRequestbodyRegisterUser = read('../../resources\\requestBodyRegisterUser.json')
    # * def passwordCreationUtilis = Java.type('examples.utils.PasswordUtility')
    # * def getpwd = passwordCreationUtilis.getPassword(8)

    Given url 'https://reqres.in'


Scenario: Test the api to get the list of users.

    * def random_string =
    """
    function(s) {
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789";
    for (var i = 0; i < s; i++)
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    return text;
    }
 """
    * def validateToken = 

    """
    function(str) {
    var code, i, len;

    for (i = 0, len = str.length; i < len; i++) {
    code = str.charCodeAt(i);
    if (!(code > 47 && code < 58) && // numeric (0-9)
        !(code > 64 && code < 91) && // upper alpha (A-Z)
        !(code > 96 && code < 123)) { // lower alpha (a-z)
    return false;
    }
    }
    return true;
    }
    """
    * def password =  random_string(10)

    Given path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And def data_id = response.data[0].id
    And path `/api/users/${data_id}`
    When method GET
    Then status 200
    And match response.data.id == data_id
    And def data_email = response.data.email
    And path '/api/register'
    And set postRequestbodyRegisterUser.email = data_email
    And set postRequestbodyRegisterUser.password = password
    And request postRequestbodyRegisterUser
    When method post
    Then status 200
    And match response.id == data_id
    * def actualToken = validateToken(response.token)
    * match actualToken == true

Scenario: Test thegetpassword from java
    * def passwordCreationUtilis = Java.type('examples.utils.PasswordUtility');
    * def getpwd = passwordCreationUtilis.getPassword(8);