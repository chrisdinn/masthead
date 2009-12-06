class UserInvite < ActiveRecord::Base  
  validates_presence_of :email
  validates_uniqueness_of :email
  
  after_create :send_invite_email
  
  private
  
  def send_invite_email
    InviteMailer.deliver_user_invite!(self)
  end
end
