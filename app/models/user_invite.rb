require 'digest/sha1'

class UserInvite < ActiveRecord::Base  
  validates_presence_of :email
  validates_uniqueness_of :email
  validate :valid_email_format?
  
  after_create :set_invite_code, :send_invite_email
  
  def self.find_redeemable(invite_code)
    self.find(:first, :conditions => {:redeemed_at => nil, :invite_code => invite_code})
  end
  
  def redeem!
    self.redeemed_at = Time.now.utc
    self.save!
  end
  
  def redeemable?
    self.redeemed_at.blank?
  end
  
  private
  
  def send_invite_email
    InviteMailer.deliver_user_invite!(self)
  end
  
  def set_invite_code
    self.invite_code = Digest::SHA1.hexdigest("--#{self.created_at.utc.to_s}--#{self.email}--")
    save
  end
  
  def valid_email_format?
    unless email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
      errors.add(:email, "must be a real address")
    end
  end
end
