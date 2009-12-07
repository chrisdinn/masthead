When /^I visit the sign in page$/ do
  @browser.get "/sso/login"
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|  
  @browser.post '/sso/login', :email => email, :password => password
  @browser.get "/"
end

Then /^I should be redirected to the login page$/ do
  @browser.last_response.should be_redirect
  @browser.last_response.location.should match("/sso/login")
end


Then /^I should be signed out$/ do
  @browser.get '/'
  @browser.last_response.should be_redirect
end

Then /^I should be signed in$/ do
  @browser.get '/'
  @browser.last_response.should be_ok
end

When /^I return next time$/ do

end
