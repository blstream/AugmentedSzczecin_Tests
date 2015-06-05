# encoding: utf-8
require 'calabash-android/calabash_steps'

#step definitions

	When /^I enter "([^\"]*)" as email$/ do |text|
	  enter_text("android.widget.EditText id:'email'", text)
	end

	When /^I enter "([^\"]*)" as password$/ do |text|
	  enter_text("android.widget.EditText id:'password'", text)
	end

	When /^I enter "([^\"]*)" as repeat password$/ do |text|
	  enter_text("android.widget.EditText id:'repeatPass'", text)
	end

#short macros

	Given /^I am logged in to application as guest$/  do
		macro 'I touch the "Pomiń" text'
	end

	Given /^I open registration form$/ do
		macro 'I press view with id "newAccountButton"'
	end

	Given /^I open login form$/ do
		macro 'I press view with id "loginButton"'
	end

	When /^I submit login form$/ do
		macro 'I press view with id "loginButton"'
	end

	When /^I submit registration form$/ do
		macro 'I press view with id "registerButton"'
	end

	When /^I switch to AR$/ do
		macro 'I press view with id "ar_switch"'
	end

#macros for login

	Given /^I am logged in to application as user$/  do
		macro 'I touch the "Zaloguj się" text'
		macro 'I enter text "test@test.pl" into field with id "email"'
		macro 'I enter text "tester" into field with id "password"'
		macro 'I touch the "Zaloguj się" text'
	end

	Given /^I log in and open AR$/ do 
		macro 'I am logged in to application as user'
		macro 'I swipe right'
		macro 'I touch the "W pobliżu" text'
		macro 'I switch to AR'
		macro 'I wait for "Augmented Reality został włączony" to appear'
	end

