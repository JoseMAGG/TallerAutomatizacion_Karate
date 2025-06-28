@appcontact_createcontact
Feature: create contact to app contact

  Background:
    * url baseUrl
    * header Accept = 'application/json'
Scenario: Login y crear contacto
  # Login
  Given path '/users/login'
  And request { "email": "joeaoi@mail.com", "password": "12345678" }
  When method POST
  Then status 200
  * def authToken = response.token

  # Crear contacto
  Given path '/contacts'
  And header Authorization = 'Bearer ' + authToken
  * def Faker = Java.type('com.github.javafaker.Faker')
  * def faker = new Faker()
  * def name = faker.name().firstName()
  * def lastName = faker.name().lastName()
  And request { "firstName": name, "lastName": lastName, "birthdate": "1970-01-01", "email": "jdoe@fake.com", "phone": "8005555555", "street1": "1 Main St.", "street2": "Apartment A", "city": "Anytown", "stateProvince": "KS", "postalCode": "12345", "country": "USA" }
  When method POST
  Then status 201
