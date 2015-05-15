Given /^I can list all places in system$/ do 
	@places = Places.new()
	fail unless @places.list
end

Given /^I can create place with name "([^\"]*)" and latitude "([^\"]*)" and longitude "([^\"]*)"$/ do |name,latitude,longitude|
	resources = {"name" => name, "latitude" => latitude, "longitude" => longitude}
	@places = Places.new()
	fail unless @places.create
end

Then /^I can remove previously created place$/ do
	fail unless @places.delete
end