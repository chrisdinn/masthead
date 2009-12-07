Then /^an invitation should be sent to "([^\"]*)"$/ do |email|
  ActionMailer::Base.deliveries.should_not be_empty
  sent_invitation = ActionMailer::Base.deliveries.last
  sent_invitation.to.should include(email)
end


Given /^pending invitations exist$/ do
  @user_invites = (1..5).collect { Factory(:user_invite) }
end

Then /^I should see all the pending invitations$/ do
  response.should have_selector("ol#user_invites") do |user_invites|
    @user_invites.each do |user_invite|
      user_invites.should have_selector("li#user_invite_#{user_invite.id}")
    end
  end
end


Given /^I have a user invite$/ do
  @user_invite = Factory(:user_invite)
  Given %{"#{@user_invite.email}" should receive an email}
end

When /^I follow the user invite redemption link$/ do
  Given %{I open the email}
  Given %{I click the first link in the email}
end

Given /^I visit the user invite redemption page with an invalid invite code$/ do
  visit redeem_user_invite_url("madeupinvitecode")
end

Given /^I have received a user invite and clicked on the redemption link$/ do
  Given %{I have a user invite}
  Given %{I follow the user invite redemption link}
end

When /^I fill out my user details$/ do
  @user_details = Factory.attributes_for(:user)
  When %{I fill in "#{@user_details[:email]}" for "Email"}
  When %{I fill in "#{@user_details[:password]}" for "Password"}
  When %{I fill in "#{@user_details[:password_confirmation]}" for "Confirm password"}
end

Then /^I should not be a user$/ do
  @user = User.find_by_email(@user_details[:email])
  @user.should be_blank
end

Then /^I should be a user$/ do
  Then %{I follow the confirmation link sent to "#{@user_details[:email]}"}
  
  @user = User.find_by_email(@user_details[:email])
  @user.should_not be_blank
  @user.email_confirmed.should be_true
end


