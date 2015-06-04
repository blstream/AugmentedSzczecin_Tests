@Android @Login
Feature: Logging to application
	!Author: Jakub Nowak
	
	!Overview: 
	User tries to login to application with different setups of username/password
	
	!Preconditions: 
	- The device is connected to the internet
	- Device has active GPS 
	- Device's input method is set to "Google Keyboard"
	- Application "Augumented Szczecin" is installed on device
	
	Scenario: Succesfull login and logout to application
		!ID: AUGMENTEDSZN-13-01
		
		!Overview: 
		User tries to login to application with correct e-mail and password,
		then user log out
		
		!Pass criteria: 
		- User is logged in
		- Application shows map in 2D
		
		When I touch the "Zaloguj się" text
		And I enter text "test@test.pl" into field with id "email"
		And I enter text "tester" into field with id "password"
		And I touch the "Zaloguj się" text
		Then I swipe right
		Then I touch the "WYLOGUJ SIĘ" text

	Scenario: Login to application with empty password field
		!ID: AUGMENTEDSZN-13-02
		
		!Overview: 
		User tries to login to application with correct e-mail and no password
		
		!Pass criteria: 
		- User is not logged in
		
		When I touch the "Zaloguj się" text
		And I enter text "test@test.pl" into field with id "email"
		And I touch the "Zaloguj się" text
		Then I wait for "Zaloguj się" to appear

	Scenario: Login to application with empty e-mail field
		!ID: AUGMENTEDSZN-13-03
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		When I touch the "Zaloguj się" text
		And I enter text "tester" into field with id "password"
		And I touch the "Zaloguj się" text
		Then I wait for "Zaloguj się" to appear

	Scenario: Login to application with e-mail without "@" 
		!ID: AUGMENTEDSZN-13-04
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		When I touch the "Zaloguj się" text
		And I enter text "test.com" into field with id "email"
		And I enter text "tester" into field with id "password"
		And I touch the "Zaloguj się" text
		Then I wait for "Nieprawidłowy login lub hasło" to appear

	Scenario: Login to application with e-mail without domain
		!ID: AUGMENTEDSZN-13-05
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		When I touch the "Zaloguj się" text
		And I enter text "test@test" into field with id "email"
		And I enter text "tester" into field with id "password"
		And I touch the "Zaloguj się" text
		Then I wait for "Nieprawidłowy login lub hasło" to appear

	Scenario: Login to application with e-mail without domain and "@" sign
		!ID: AUGMENTEDSZN-13-06
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		When I touch the "Zaloguj się" text
		And I enter text "test" into field with id "email"
		And I enter text "tester" into field with id "password"
		And I touch the "Zaloguj się" text
		Then I wait for "Nieprawidłowy login lub hasło" to appear

	Scenario: Login to application with e-mail with only ".""
		!ID: AUGMENTEDSZN-13-07
		
		!Overview: 
		User tries to login to application with correct password and no e-mail
		
		!Pass criteria: 
		- User is not logged in
		
		When I touch the "Zaloguj się" text
		And I enter text "test@test." into field with id "email"
		And I enter text "tester" into field with id "password"
		And I touch the "Zaloguj się" text
		Then I wait for "Nieprawidłowy login lub hasło" to appear

	Scenario: Skipping login to application and exiting
		!ID: AUGMENTEDSZN-13-08
		
		!Overview: 
		User opens the app as guest and exits.
		
		!Pass criteria: 
		- User is logged as guest
		
		When I touch the "Pomiń" text
		Then I swipe right
		Then I touch the "WYLOGUJ SIĘ" text