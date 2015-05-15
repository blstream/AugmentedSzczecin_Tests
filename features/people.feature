Feature: People operations feature


Scenario: CRUD People
    Given I can list all people in system
    #Given I can create person with name "Test" nad surname "Testowy+0" and latitude "53.437827" and longitude "14.53217"
    Given I can create person with name "Test" and latitude "53.437827" and longitude "14.53217"
    #Then I can search previously created person - w wyniku metoda zwraca Credentials are required to access this resource.
    #Then I can update previously created person with name "Test_edit" and latitude "54.437827" and longitude "15.53217"
    Then I can remove previously created person
    Given I can list all people in system



