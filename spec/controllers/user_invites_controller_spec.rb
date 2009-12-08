require 'spec_helper'

describe UserInvitesController do
  before(:each) do
    @current_user = Factory(:user)
  end
  
  describe "GET to new" do
    before(:each) do
      get :new, {}, :checkpoint_user_id => @current_user.id
    end
    
    it { should assign_to(:user_invite).with_kind_of(UserInvite) }
    it { should render_template(:new) }
  end
  
  describe "POST to create" do
    describe "with valid email address" do
      before(:each) do
        @email = Factory.next(:email)
        post :create, { :user_invite => { :email => @email } }, :checkpoint_user_id => @current_user.id
      end

      it { should assign_to(:user_invite).with_kind_of(UserInvite) }
      it { should set_the_flash }
      it { should respond_with(:redirect) }
    end
    describe "with invalid email address" do
      before(:each) do
        post :create, { :user_invite => { :email => "thisisnotanemailaddress" } }, :checkpoint_user_id => @current_user.id
      end

      it { should render_template(:new) }
    end
  end
  
end