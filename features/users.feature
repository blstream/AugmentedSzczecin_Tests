Feature: Users operations feature
  
Scenario: Create user
    Given I can create user with email "some_mail+6@gmail.com" and password "12341234"
    Then I can remove previously created user

Scenario: List all users
    Given I can list all user in system

Scenario: Search user by Id
	Given I can search for specific user by search Id "5549f2b2e4b05304c294d187"