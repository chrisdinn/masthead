class InviteMailer < ActionMailer::Base
  def user_invite(invite)
    recipients    invite.email
    from          "Hot Ink <do_not_reply@hotink.net>"
    subject       "You've been invited to use Hot Ink"
    sent_on       Time.now
    body          :invite => invite
  end  
end
