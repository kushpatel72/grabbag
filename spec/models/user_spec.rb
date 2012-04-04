require 'spec_helper'

describe User do
  
  before do
    @user = User.new(:email => "hello@gmail.com", :password => "foobar")
  end
  
  describe "profile associations" do
    
    before { @user.save }
    
    it "create profile after successful user creation" do
      Profile.find_by_user_id(@user.id).should be_true
    end
    
    
  end
  
end