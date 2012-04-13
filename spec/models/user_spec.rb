# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  first_name             :string(255)
#  last_name              :string(255)
#  button_count           :integer
#  database_authenticable :boolean
#  confirmable            :boolean
#

require 'spec_helper'

describe User do
  
  before do
    @user = User.new(:email => "hello@gmail.com", :password => "foobar", :first_name => "Joe", :last_name => "Blow")
  end
 
  subject { @user }
 
  it { should be_valid }
  
  describe "attribute presence" do
    
    REQUIRED_ITEMS = [:first_name=, :last_name=]
    
    REQUIRED_ITEMS.each do |req|
      
      it "when #{req} is not present" do
        @user.send(req, " ")
        @user.should_not be_valid
      end  
      
    end
    
  end
    
  describe "when first_name is too long" do
    before { @user.first_name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when last_name is too long" do
    before { @user.last_name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to buckle_count" do
      expect do
        User.new(:button_count => 50)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end  

end
