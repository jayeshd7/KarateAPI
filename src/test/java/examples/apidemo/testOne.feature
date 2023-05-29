Feature: test the reqres different api's

Background: 
    * def getSchemaFile = read('../../resources\\schemaGetUser.json')



Scenario: Test the api to get the list of users.
    Given url 'https://reqres.in'
    And path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response

Scenario: Schema validation and structure
    Given url 'https://reqres.in'
    And path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response == getSchemaFile.schemaOne

Scenario: data Schema validation and structure
    Given url 'https://reqres.in'
    And path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response == getSchemaFile.schemaOne
    And match response.data[0] == getSchemaFile.data_schema


Scenario: per page validation
    Given url 'https://reqres.in'
    And path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And print response
    And match response.page == 2


Scenario: full schema validation
    Given url 'https://reqres.in'
    And path '/api/users'
    And param page = 2
    When method GET
    Then status 200
    And def data_schema =
    
    """
    [
        {
        "id":"#number",
        "email": "#string",
        "first_name": "#string",
        "last_name": "#string",
        "avatar": "#string"
    }
    ]
    """
    And def support_schema = 
    """
    {
            "url": "#string",
            "text": "#string"

    }
    """
    And def response_schema =
        """        {
                "page": "#number",
                "per_page": "#number",
                "total": "#number",
                "total_pages":"#number",
                "data" : "#(data_schema)",
                "support": "#(support_schema)"
        }
        """
    And def size = karate.sizeOf(response.data)
    And print size


    And match response.support == response_schema.support
    And match response.data[0] == response_schema.data[0]




