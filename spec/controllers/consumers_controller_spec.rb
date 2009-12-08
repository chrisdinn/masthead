require 'spec_helper'

describe ConsumersController do
  before(:each) do
    @current_user = Factory(:user)
  end

  describe "when valid consumers exist" do
    before(:each) do
      @consumers = (1..5).collect { Factory(:consumer) }
    end

    describe "GET 'index'" do
      before(:each) do
        get 'index', {}, :checkpoint_user_id => @current_user.id
      end
      
      it { should assign_to(:consumers).with_kind_of(Array) }
      it { should render_template(:index) }
    end
    
    describe "DELETE 'destroy'" do
      before(:each) do
        delete 'destroy', { :id => @consumers.first.id }, :checkpoint_user_id => @current_user.id
      end
      
      it "should be delete the consumer" do
        Consumer.find_by_id(@consumers.first.id).should be_blank
      end
      it { should respond_with(:redirect) }
    end
  end

  describe "GET 'new'" do
    before(:each) do
      get 'new', {}, :checkpoint_user_id => @current_user.id
    end
    
    it { should assign_to(:consumer).with_kind_of(Consumer) }
    it { should render_template(:new) }
  end

  describe "POST 'create'" do
    describe "with valid consumer params" do
      before(:each) do
        post 'create', { :consumer => Factory.attributes_for(:consumer) }, :checkpoint_user_id => @current_user.id
      end
    
      it { should set_the_flash }
      it { should respond_with(:redirect) }
    end
    describe "with invalid consumer params" do
      before(:each) do
        @consumer = Factory(:consumer)
        post 'create', {:consumer => @consumer.attributes }, :checkpoint_user_id => @current_user.id
      end
      
      it { should render_template(:new) }
    end
  end


end
