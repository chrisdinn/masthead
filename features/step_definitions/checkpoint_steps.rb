When /^I visit the sign in page$/ do
  @browser.get "/sso/login"
end

When /^I sign in as "(.*)\/(.*)"$/ do |email, password|  
  @browser.post '/sso/login', :email => email, :password => password
  @browser.get "/"
end

When /^I should notice "([^\"]*)" in the response$/ do |text|
  @browser.last_response.body.should include(text)
end

Then /^I should be signed out$/ do
  @browser.get '/'
  @browser.last_response.status.should == 301
end

Then /^I should be signed in$/ do
  @browser.get '/'
  @browser.last_response.should be_ok
end

When /^I return next time$/ do

end
