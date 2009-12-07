require 'spec_helper'
require 'digest/sha1'


describe UserInvite do
    subject { UserInvite.create!(Factory.attributes_for(:user_invite)) }
  
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it "should validate that email is properly formatted" do
      invite = Factory(:user_invite)
      invite.email = "itsme"
      invite.should_not be_valid
      invite.email = "itsme@ca"
      invite.should_not be_valid
    end
    
    it "should send a user invite email when created" do
      InviteMailer.should_receive(:deliver_user_invite!)
      user_invite = UserInvite.create!(Factory.attributes_for(:user_invite))
    end
    
    it "should generate a secure invite code when created" do
      user_invite = Factory(:user_invite)
      user_invite.invite_code.should == Digest::SHA1.hexdigest("--#{user_invite.created_at.utc.to_s}--#{user_invite.email}--")
    end
    
    it "should find redeemable invitation" do
      user_invite = Factory(:user_invite)
      UserInvite.find_redeemable(user_invite.invite_code).should == user_invite
    end
    
    it "should be redeemable only once" do
      user_invite = Factory(:user_invite)
      user_invite.redeem!.should be_true
      UserInvite.find_redeemable(user_invite.invite_code).should be_nil
    end
    
    it "should know if it's redeemable" do
      user_invite = Factory(:user_invite)
      user_invite.should be_redeemable
      user_invite.redeem!
      user_invite.should_not be_redeemable
    end

end