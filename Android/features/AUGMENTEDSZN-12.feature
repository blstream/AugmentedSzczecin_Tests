@Android @Register
Feature: Registration
	!Author: Jakub Nowak
	
	!Overview: 
	User tries to register account in app
	
	!Preconditions: 
	- The device is connected to the internet
	- Device has active GPS 
	- Application "Augumented Szczecin" is installed on device
	
	Scenario: Trying to create account with all fields empty
		!ID: AUGMENTEDSZN-12-01
		
		!Overview: 
		User tries to create account while all fields are empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I submit registration form
		Then I wait for "Nie wypełniono formularza" to appear

	Scenario: Trying to create account with "hasło" and "powtórz hasło" fields empty
		!ID: AUGMENTEDSZN-12-02
		
		!Overview: 
		User tries to create account only using e-mail address
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter "testowy@mail.com" as email
		And I submit registration form
		Then I wait for "Nie podano hasła" to appear

	Scenario: Trying to create account with "hasło" field empty
		!ID: AUGMENTEDSZN-12-03
		
		!Overview: 
		User tries to create account while field "e-mail" and "powtórz hasło" are set, and "hasło" empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter "testowy@mail.com" as email
		And I enter "test123" as password
		And I submit registration form
		Then I wait for "Nie podano hasła" to appear
	
	Scenario: Trying to create account with "powtórz hasło" field empty
		!ID: AUGMENTEDSZN-12-04
		
		!Overview: 
		User tries to create account while field "e-mail" and "hasło" are set, and "powtórz hasło" empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter "testowy@mail.com" as email
		And I enter "test123" as password
		And I submit registration form
		Then I wait for "Nie podano hasła" to appear

	Scenario: Trying to create account with "e-mail" field empty
		!ID: AUGMENTEDSZN-12-05
		
		!Overview: 
		User tries to create account while password fields are set and "email" is empty
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter "test123" as password
		And I enter "test123" as repeat password
		And I submit registration form
		Then I wait for "Nie podałeś adresu e-mail" to appear

	Scenario: Trying to create account with different passwords
		!ID: AUGMENTEDSZN-12-06
		
		!Overview: 
		User tries to create account while given passwords differ
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter "testowy@mail.com" as email
		And I enter "test1234" as password
		And I enter "test123" as repeat password
		And I submit registration form
		Then I wait for "Hasła nie są jednakowe" to appear

	Scenario: Trying to create account with too short passwords
		!ID: AUGMENTEDSZN-12-07
		
		!Overview: 
		User tries to create account while given passwords are too short (under 6 signs)
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter "testowy@mail.com" as email
		And I enter "test" as password
		And I enter "test" as repeat password
		And I submit registration form
		Then I wait for "Hasło za krótkie" to appear

	Scenario: Trying to create account with email without "@" and domain
		!ID: AUGMENTEDSZN-12-08
		
		!Overview: 
		User tries to create account while e-mail address is missing "@" and domain
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter "testowymail" as email
		And I enter "test123" as password
		And I enter "test123" as repeat password
		And I submit registration form
		Then I wait for "Podano błędny adres e-mail" to appear

	Scenario: Trying to create account with email without "@" 
		!ID: AUGMENTEDSZN-12-09
		
		!Overview: 
		User tries to create account while email is missing "@"
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter "testowymail.com" as email
		And I enter "test123" as password
		And I enter "test123" as repeat password
		And I submit registration form
		Then I wait for "Podano błędny adres e-mail" to appear

	Scenario: Trying to create account with email without domain
		!ID: AUGMENTEDSZN-12-10
		
		!Overview: 
		User tries to create account while email is missing domain
		
		!Pass criteria: 
		-user can't create an account
		
		Given I open registration form
		When I enter "testowy@mail" as email
		And I enter "test123" as password
		And I enter "test123" as repeat password
		And I submit registration form
		Then I wait for "Podano błędny adres e-mail" to appear