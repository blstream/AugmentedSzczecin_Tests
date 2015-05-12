
Then /^I can create user with email "([^\"]*)" and password "([^\"]*)"$/ do |email, passwd|
  @user = User.new(email,passwd)
  fail unless @user.create
end

Then /^I can remove previously created user$/ do
  fail unless @user.delete
end

Given /^I can list all user in system$/ do
	@users = User.new()
	fail unless @users.list
end

Given /^I can search for specific user by search Id "([^\"]*)"$/ do |searchId|
	@user = User.new(searchId)
	fail unless @user.search		
	end