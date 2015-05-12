Feature: Places operations feature


Scenario: List all places in system
    Given I can list all places in system

 Scenario: Search place
    Given I can search place by Id "554a6279e4b05304c294d194"

Scenario: Create place
    Given I can create place with name "testowe" and latitude "15" and longitude "15"

Scenario: Update place
    Given I can update place with id "55394a83e4b0f627aeb1b605" and name "thug666" and latitude "19" and longitude "19"


#Scenario: Update person
#    Then I can remove previously created user    

#Scenario: Delete person
#    Then I can remove previously created user