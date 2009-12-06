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
