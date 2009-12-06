Given /^there are users in the directory$/ do
  @users = (1..5).collect{ Factory(:user) }
end

Then /^I should see all the users$/ do
  response.should have_selector("ol#users") do |users|
    @users.each do |user|
      users.should have_selector("li#user_#{user.id}")
    end
  end
end