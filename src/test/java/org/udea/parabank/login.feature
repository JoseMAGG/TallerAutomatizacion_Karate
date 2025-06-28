@parabank_login
Feature: Login to Parabank

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Customer Login
    Given path 'users/login'
    And request {"email": "joeaoi@mail.com", "password": "12345678"}
    When method POST
    Then status 200
    And match response ==
    """
    {
    "user": {
        "_id": '#string',
        "firstName": '#string',
        "lastName": '#string',
        "email": '#string',
        "__v": '#number',
    },
    "token": '#string',
    }
    """
