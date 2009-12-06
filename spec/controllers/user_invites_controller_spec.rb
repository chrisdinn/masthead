require 'spec_helper'

describe UserInvitesController do
  
  describe "GET to new" do
    before(:each) do
      get :new
    end
    
    it { should assign_to(:user_invite).with_kind_of(UserInvite) }
    it { should render_template(:new) }
  end
  
  describe "POST to create" do
    describe "with valid attributes" do
      before(:each) do
        @email = Factory.next(:email)
        post :create, :user_invite_email => @email
      end


    end
  end
  
end