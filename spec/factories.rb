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

Factory.define :consumer do |consumer|
  consumer.sequence(:label) { |n| "Consumer #{n}" }
  consumer.sequence(:url) { |n| "http://sso#{n}.consumerapp.com/sso"}
end
