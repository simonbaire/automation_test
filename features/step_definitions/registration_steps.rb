And /^I have a new user profile$/ do
  @user = Profile.new
end

When /^I create a new account$/ do
  website.authentication.submit_email(@user.email)
  website.registration.create_account(@user)
end

Then /^I expect to see "([^"]*)"$/ do |greeting|
  expect(website.account.info_account.text).to include(greeting)
end



