require 'spec_helper'

describe UsersController do
  
  describe "GET to /users" do
    before(:each) do
      get :index, {}, :checkpoint_user_id => 1
    end
    
    it { should assign_to(:users) }
    it { should assign_to(:user_invites) }
  end
  
  describe "POST to /users" do
    describe "without a valid invite" do
      before(:each) do
        post :create, :invite_code => "madeupinvitecode", :user => Factory.attributes_for(:user)
      end
      it { should render_template(:new) }
    end
    describe "with a valid invite" do
      before(:each) do
        UserInvite.destroy_all
        @user_details = Factory.attributes_for(:user)
        @invite = UserInvite.find_redeemable(@user_details[:invite_code])
        post :create, :invite_code => @invite.invite_code, :user => @user_details
      end
      
      it { should set_the_flash }
      it { should respond_with(302) }
      
      it "should create user" do
        User.find_by_email(@user_details[:email]).should_not be_blank
      end
      
      it "should redeem invite" do
        UserInvite.find_redeemable(@invite.invite_code).should be_nil
      end
    end
  end

end
