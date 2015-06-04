# encoding: utf-8
require 'calabash-android/calabash_steps'

Given /^I am logged in to application as user$/  do
	macro 'I touch the "Zaloguj się" text'
	macro 'I enter text "test@test.pl" into field with id "email"'
	macro 'I enter text "tester" into field with id "password"'
	macro 'I touch the "Zaloguj się" text'
end

Given /^I am logged in to application as guest$/  do
	macro 'I touch the "Pomiń" text'
end

Given /^I log in and open AR$/ do 
	macro 'I am logged in to application as user'
	macro 'I swipe right'
	macro 'I touch the "W pobliżu" text'
	macro 'I press view with id "ar_switch"'
	macro 'I wait for "Augmented Reality został włączony" to appear'
end

Given /^I open registration form$/ do
	macro 'I touch the "Załóż konto" text'
end