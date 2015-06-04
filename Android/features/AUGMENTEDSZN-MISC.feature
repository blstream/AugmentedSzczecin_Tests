@Android @Misc
Feature: Testing miscellaneous features
	!Author: Jakub Nowak
	
	!Overview: 
	
	!Preconditions: 
	- The device is connected to the internet
	- Device has active GPS 
	- Device's input method is set to "Google Keyboard"
	- Application "Augumented Szczecin" is installed on device
	- Application has default categories
	
	@POI
	Scenario: Viewing list of POI
		!ID: AUGMENTEDSZN-MISC-01
		
		!Overview: 
		User log in to app and views list of available POI
		
		!Pass criteria: 
		-Application shows list of POI
		
		Given I am logged in to application as user
		When I swipe right
		And I touch the "Moje Miejsca" text
		Then I should see text containing "Moje Miejsca"
		And I wait for the view with id "list" to appear
		And I swipe right
		And I touch the "WYLOGUJ SIĘ" text

	@AR
	Scenario: Switching to Augmented Reality view
		!ID: AUGMENTEDSZN-MISC-02

		!Overview:
		User logs in to app, displays map and switches to Augumented Reality mode

		!Pass criteria:
		-Application switches to AR

		Given I am logged in to application as user
		When I swipe right
		And I touch the "W pobliżu" text
		And I press view with id "ar_switch"
		Then I wait for "Augmented Reality został włączony" to appear

	@AR @2D
	Scenario: Switching from AR to 2D
		!ID: AUGMENTEDSZN-MISC-02ww

		!Overview:
		User logs in to app, displays map, switches to AR and then back to map

		!Pass criteria:
		-Application switches to AR, and back to map

		Given I log in and open AR
		When I press view with id "map2dButton"
		Then I wait for "Augmented Reality został wyłączony" to appear
		And I wait for the view with id "map" to appear

	#Scenario: Viewing list of POI
	#	!ID: AUGMENTEDSZN-MISC-02
	#	
	#	!Overview: 
	#	User log in to app and views list of available POI
	#	
	#	!Pass criteria: 
	#	-Application shows list of POI
	#	
	#	Given I am logged in to application as guest
