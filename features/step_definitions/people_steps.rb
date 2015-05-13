Given /^I can list all people in system$/ do 
	@people = People.new()
	fail unless @people.list
end

Given /^I can create person with name "([^\"]*)" nad surname "([^\"]*)" and latitude "([^\"]*)" and longitude "([^\"]*)"$/ do |name,surname,latitude,longitude|
	resources = {"name" => name, "surname" => surname, "latitude" => latitude, "longitude" => longitude}
	@people = People.new(resources)
	fail unless @people.create	
end

Given /^I can create person with name "([^\"]*)" and latitude "([^\"]*)" and longitude "([^\"]*)"$/ do |name,latitude,longitude|
	resources = {"name" => name, "latitude" => latitude, "longitude" => longitude}
	@people = People.new(resources)
	fail unless @people.create	
end

Then /^I can search previously created person$/ do
	fail unless @people.search
end

Then /^I can update previously created person with name "([^\"]*)"  and latitude "([^\"]*)"  and longitude "([^\"]*)"$/ do |name,latitude,longitude|
	resources = {"name" => name, "latitude" => latitude, "longitude" => longitude}
	@people = People.new(resources)
	fail unless @people.create
end	

Then /^I can remove previously created person$/ do
	fail unless @people.delete
end





