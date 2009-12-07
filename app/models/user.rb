class User < ActiveRecord::Base
  include Clearance::User
  
  validate_on_create :valid_invite_code?
  
  after_create :redeem_invite
  
  attr_accessor :invite_code
  
  def invite
    UserInvite.find_redeemable(@invite_code) 
  end
  
  private
  
  def redeem_invite
    invite.redeem!
  end
  
  def valid_invite_code?
    unless invite
      errors.add("must have an invitation in order to sign up")
    end
  end
end
