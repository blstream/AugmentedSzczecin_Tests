Given /^I can list all places in system$/ do 
	@places = Places.new()
	fail unless @places.list
end

Given /^I can search place by Id "([^\"]*)"$/ do |searchId|
	@places = Places.new(searchId)
	fail unless @places.search
end

Given /^I can create place with name "([^\"]*)" and latitude "([^\"]*)" and longitude "([^\"]*)"$/ do |name,latitude,longitude|
	@places = Places.new(name,latitude,longitude)
	fail unless @places.create
end

Given /^I can update place with id "([^\"]*)" and name "([^\"]*)" and latitude "([^\"]*)" and longitude "([^\"]*)"$/ do |searchId,name,latitude,longitude|
	@places = Places.new(searchId,name,latitude,longitude)
	fail unless @places.update
end