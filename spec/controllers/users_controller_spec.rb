require 'spec_helper'

describe Clearance::UsersController do

  #Delete these examples and add some real ones
  it "should use the UsersController class of the Clearance module" do
    controller.should be_an_instance_of(Clearance::UsersController)
  end
  
  describe "GET to /users" do
    before(:each) do
      get :index
    end
    
    it { should assign_to(:users) }
  end

end
