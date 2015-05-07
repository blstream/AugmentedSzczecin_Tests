
Then /^I can create user with email "([^\"]*)" and password "([^\"]*)"$/ do |email, passwd|
  @user = User.new(email,passwd)
  fail unless @user.create
end

Then /^I can remove previously created user$/ do
  fail unless @user.delete
end