# == Schema Information
#
# Table name: bags
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  approved    :boolean
#  color       :integer(255)
#  description :text
#  brand       :integer(255)
#  condition   :integer
#  size        :integer
#  price_paid  :integer
#  button_cost :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

require 'spec_helper'

describe Bag do

  let(:owner) { FactoryGirl.create(:user) }

  before do
    @bag = owner.bags.new(:color => '5', :brand => '4', :condition => '2', :size => '2', :price_paid => '50', :button_cost => '20')
  end
  
  subject { @bag }
  
  it { should be_valid }
  # it { should be_approved }
  
  describe "attribute presence" do
    
    REQUIRED_ITEMS = [:user_id=, :color=, :brand=, :condition=, 
                      :size=, :price_paid=, :button_cost=]
    
    REQUIRED_ITEMS.each do |req|
      
      it "when #{req} is not present" do
        @bag.send(req, nil)
        @bag.should_not be_valid
      end  
      
    end
    
  end
  
  describe "when size is not either 1(sm), 2(med) or 3(lg)" do
    it "when size is 0" do
      @bag.size = 0
      @bag.should_not be_valid
    end
    
    it "when size is 4" do
      @bag.size = 4
      @bag.should_not be_valid
    end
  end
  
  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Bag.new(:user_id => 1)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
    
    it "should not allow access to approved" do
      expect do
        Bag.new(:approved => false)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end


end
