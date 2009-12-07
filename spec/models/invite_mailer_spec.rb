require 'spec_helper'

describe InviteMailer do
  describe "user invite email" do
    before(:each) do
      @invite = Factory(:user_invite)
      @email = ActionMailer::Base.deliveries.last
    end    

    it "should be set to be delivered to the email passed in" do
      @email.should deliver_to(@invite.email)
    end

    it "should contain a link to the invite redemption link" do
      @email.should have_text(/#{@invite.invite_code}/)
    end

    it "should have the correct subject" do
      @email.should have_subject(/invit/i)
    end
  end
end