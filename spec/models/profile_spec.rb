require 'spec_helper'

describe Profile do
  
  describe "Profile validation" do
  
    it "requires an associated User" do
      profile = Profile.new
      profile.save.should be_false
    end  
    
    it "requires a first name" do

    end
    
  end
  
  describe "User/Profile association" do
  
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
    
  describe "Profile attributes" do
    
    before do
      @user = User.new(:email => "hello@gmail.com", :password => "foobar")
      @user.save
      @profile = @user.profile  
    end  
    
    it { should respond_to(:first_name) }
    it { should respond_to(:last_name) }
    it { should respond_to(:buckle_count) }
  
  end
  
  
  
end
