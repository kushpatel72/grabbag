require 'spec_helper'

describe UsersController do
  render_views
  login_user
  
  describe "GET 'show'" do

    before { @user = FactoryGirl.create(:user) }
    
    it "returns http success" do
      get :show, :id => @user
      response.should be_success
    end
    
    it "does something"
    
    it "finds the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end
      
    it "has the user's first name" do
      get :show, :id => @user

      response.body.should have_selector('h1')
    end
    
    context "same user" do
    
      it "has an edit link/button"
    
    end
    
    context "different user" do
      
      it "has no edit link/button"
      
    end
    
  end

end
