require 'spec_helper'

describe Clearance::UsersController do
  
  describe "GET to /users" do
    before(:each) do
      get :index
    end
    
    it { should assign_to(:users) }
    it { should assign_to(:user_invites) }
  end

end
