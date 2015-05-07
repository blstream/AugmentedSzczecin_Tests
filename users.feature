Feature: Users operations feature
  
  Scenario: Create user
    Given I can create user with email "some_mail+5@gmail.com" and password "12341234"
    Then I can remove previously created user