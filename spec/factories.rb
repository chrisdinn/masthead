Factory.define :user_invite do |user_invite|
  user_invite.email { Factory.next :email } 
end

Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :user do |user|
  user.email                 { Factory.next :email }
  user.password              { "password" }
  user.password_confirmation { "password" }
  user.invite_code           { Factory(:user_invite).invite_code }
end

Factory.define :email_confirmed_user, :parent => :user do |user|
  user.email_confirmed { true }
end
