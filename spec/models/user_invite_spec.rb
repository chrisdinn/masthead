require 'spec_helper'

describe UserInvite do
    subject { UserInvite.create!(Factory.attributes_for(:user_invite)) }
  
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    
    it "should send a user invite email" do
      InviteMailer.should_receive(:deliver_user_invite!)
      user_invite = UserInvite.create!(Factory.attributes_for(:user_invite))
    end
end