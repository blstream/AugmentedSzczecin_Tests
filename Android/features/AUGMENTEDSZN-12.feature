@Android @Register
Feature: Registration
	!Author: Jakub Nowak
	
	!Overview: 
	User tries to register account in app
	
	!Preconditions: 
	- The device is connected to the internet
	- Device has active GPS 
	- Device's input method is set to "Google Keyboard"
	- Application "Augumented Szczecin" is installed on device
	
	Scenario: Trying to create account with all fields empty
		!ID: AUGMENTEDSZN-12-01
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I touch the "Zarejestruj" text
		Then I wait for "Nie wypełniono formularza" to appear

	Scenario: Trying to create account with "hasło" and "powtórz hasło" fields empty
		!ID: AUGMENTEDSZN-12-02
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter text "testowy@mail.com" into field with id "email"
		And I touch the "Zarejestruj" text
		Then I wait for "Nie podano hasła" to appear

	Scenario: Trying to create account with "hasło" field empty
		!ID: AUGMENTEDSZN-12-03
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter text "testowy@mail.com" into field with id "email"
		And I enter text "test123" into field with id "repeatPass"
		And I touch the "Zarejestruj" text
		Then I wait for "Nie podano hasła" to appear
	
	Scenario: Trying to create account with "powtórz hasło" field empty
		!ID: AUGMENTEDSZN-12-04
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter text "testowy@mail.com" into field with id "email"
		And I enter text "test123" into field with id "password"
		And I touch the "Zarejestruj" text
		Then I wait for "Nie podano hasła" to appear

	Scenario: Trying to create account with "e-mail" field empty
		!ID: AUGMENTEDSZN-12-05
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter text "test123" into field with id "password"
		And I enter text "test123" into field with id "repeatPass"
		And I touch the "Zarejestruj" text
		Then I wait for "Nie podałeś adresu e-mail" to appear

	Scenario: Trying to create account with different passwords
		!ID: AUGMENTEDSZN-12-06
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter text "testowy@mail.com" into field with id "email"
		And I enter text "test1234" into field with id "password"
		And I enter text "test123" into field with id "repeatPass"
		And I touch the "Zarejestruj" text
		Then I wait for "Hasła nie są jednakowe" to appear

	Scenario: Trying to create account with too short passwords
		!ID: AUGMENTEDSZN-12-07
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter text "testowy@mail.com" into field with id "email"
		And I enter text "test" into field with id "password"
		And I enter text "test" into field with id "repeatPass"
		And I touch the "Zarejestruj" text
		Then I wait for "Hasło za krótkie" to appear

	Scenario: Trying to create account with email without "@" and domain
		!ID: AUGMENTEDSZN-12-08
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter text "testowymail" into field with id "email"
		And I enter text "test123" into field with id "password"
		And I enter text "test123" into field with id "repeatPass"
		And I touch the "Zarejestruj" text
		Then I wait for "Podano błędny adres e-mail" to appear

	Scenario: Trying to create account with email without "@" 
		!ID: AUGMENTEDSZN-12-09
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter text "testowymail.com" into field with id "email"
		And I enter text "test123" into field with id "password"
		And I enter text "test123" into field with id "repeatPass"
		And I touch the "Zarejestruj" text
		Then I wait for "Podano błędny adres e-mail" to appear

	Scenario: Trying to create account with email without domain
		!ID: AUGMENTEDSZN-12-10
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter text "testowy@mail" into field with id "email"
		And I enter text "test123" into field with id "password"
		And I enter text "test123" into field with id "repeatPass"
		And I touch the "Zarejestruj" text
		Then I wait for "Podano błędny adres e-mail" to appear