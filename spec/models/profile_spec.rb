require 'spec_helper'

describe Profile do
  
  before { @user = User.new(:email => "hello@gmail.com", :password => "foobar") }
  
  it "gets created after a successful User creation" do
    @user.save
    @user.profile.user_id.should == @user.id
  end
  
  it "gets destroyed with User destruction" do
      @user.save
      profile = @user.build_profile
      profile.save
      @user.destroy
      Profile.find_by_user_id(@user.id).should be_nil
    end
  
end
