When /^I visit the sign in page$/ do
  visit "/sso/login"
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|
  When %{I am on the sign in page}
  begin
    When %{I fill in "#{email}" for "email"}
    When %{I fill in "#{password}" for "password"}
    When %{I press "Log in"}
  rescue URI::InvalidURIError # Sinatra redirects seem to confuse webrat
  end
end

Then /^I should be redirected to the login page$/ do
  Then %{I should see "log in"}
end

When /^I sign out$/ do
  begin
    visit '/sso/logout'
  rescue URI::InvalidURIError # Sinatra redirects seem to confuse webrat
  end
end

Then /^I should be signed in$/ do
  visit "/"
  Then %{I should see "Users"}
end

Then /^I should be signed out$/ do
  visit "/"
  Then %{I should see "You need to log in"}
end



When /^I return next time$/ do

end
