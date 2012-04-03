require 'spec_helper'

describe Profile do
  
  before do 
    @user = User.new(:email => "hello@gmail.com", :password => "foobar")
  end
  
  it "gets created after a successful User creation" do
    expect { @user.save }.to change(Profile, :count).by(1)
  end
  
  it "gets destroyed with User destruction" do
    @user.save
    expect { @user.destroy }.to change(Profile, :count).by(-1)    # 
      # @user.save
      # profile = @user.build_profile
      # profile.save
      # @user.destroy
      # Profile.find_by_user_id(@user.id).should be_nil
  end
  
end
