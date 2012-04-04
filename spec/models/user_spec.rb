require 'spec_helper'

describe User do
  
  before do
    @user = User.new(:email => "hello@gmail.com", :password => "foobar", :first_name => "Joe", :last_name => "Blow")
  end
 
  it { @user.should be_valid }
  
  describe "when first_name is not present" do
    before { @user.first_name = " " }
    it { @user.should_not be_valid }
  end
  
  describe "when last_name is not present" do
    before { @user.last_name = " " }
    it { @user.should_not be_valid }
  end
  
  describe "when first_name is too long" do
    before { @user.first_name = "a" * 51 }
    it { @user.should_not be_valid }
  end
  
  describe "when last_name is too long" do
    before { @user.last_name = "a" * 51 }
    it { @user.should_not be_valid }
  end
  
end