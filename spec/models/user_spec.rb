require 'spec_helper'

describe User do
  
  it "should require valid invite code to be created" do
    invalid_user = Factory.build(:user)
    invalid_user.invite_code = nil
    invalid_user.save
    invalid_user.should be_new_record
    
    valid_user = Factory.build(:user)
    valid_user.invite_code = Factory(:user_invite).invite_code
    valid_user.save
    valid_user.should_not be_new_record
  end
  
  it "should redeem user invite when created" do
    invite = Factory(:user_invite)
    user = Factory(:user, :invite_code => invite.invite_code)
    invite.reload.should_not be_redeemable #reload to catch redemption
  end
  
end