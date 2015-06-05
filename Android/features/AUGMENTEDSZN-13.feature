@Android @Login
Feature: Logging to application
	!Author: Jakub Nowak
	
	!Overview: 
	User tries to login to application with different setups of username/password
	
	!Preconditions: 
	- The device is connected to the internet
	- Device has active GPS 
	- Application "Augumented Szczecin" is installed on device
	
	Scenario: Succesfull login and logout to application
		!ID: AUGMENTEDSZN-13-01
		
		!Overview: 
		User tries to login to application with correct e-mail and password,
		then user log out
		
		!Pass criteria: 
		- User is logged in
		- Application shows map in 2D
		
		Given I open login form
		When I enter "test@test.pl" as email
		And I enter "tester" as password
		And I submit login form
		Then I swipe right
		Then I touch the "WYLOGUJ SIĘ" text

	Scenario: Login to application with empty password field
		!ID: AUGMENTEDSZN-13-02
		
		!Overview: 
		User tries to login to application with correct e-mail and no password
		
		!Pass criteria: 
		- User is not logged in
		
		Given I open login form
		When I enter "test@test.pl" as email
		And I submit login form
		Then I wait for "Zaloguj się" to appear

	Scenario: Login to application with empty e-mail field
		!ID: AUGMENTEDSZN-13-03
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		Given I open login form
		When I enter "tester" as password
		And I submit login form
		Then I wait for "Zaloguj się" to appear

	Scenario: Login to application with e-mail without "@" 
		!ID: AUGMENTEDSZN-13-04
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		Given I open login form
		When I enter "test.com" as email
		And I enter "tester" as password
		And I submit login form
		Then I wait for "Nieprawidłowy login lub hasło" to appear

	Scenario: Login to application with e-mail without domain
		!ID: AUGMENTEDSZN-13-05
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		Given I open login form
		When I enter "test@test" as email
		And I enter "tester" as password
		And I submit login form
		Then I wait for "Nieprawidłowy login lub hasło" to appear

	Scenario: Login to application with e-mail without domain and "@" sign
		!ID: AUGMENTEDSZN-13-06
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		Given I open login form
		When I enter "test" as email
		And I enter "tester" as password
		And I submit login form
		Then I wait for "Nieprawidłowy login lub hasło" to appear

	Scenario: Login to application with e-mail with only ".""
		!ID: AUGMENTEDSZN-13-07
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		Given I open login form
		When I enter "test@test." as email
		And I enter "tester" as password
		And I submit login form
		Then I wait for "Nieprawidłowy login lub hasło" to appear

	@Skip
	Scenario: Skipping login to application and exiting
		!ID: AUGMENTEDSZN-13-08
		
		!Overview: 
		User opens the app as guest and exits.
		
		!Pass criteria: 
		- User is logged as guest
		
		When I press view with id "skipButton"
		Then I swipe right
		Then I touch the "WYJŚCIE" text