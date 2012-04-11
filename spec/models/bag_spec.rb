# == Schema Information
#
# Table name: bags
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  approved    :boolean
#  color       :string(255)
#  description :text
#  brand       :string(255)
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
  
  # describe "attribute presence" do
  #   
  #   REQUIRED_ITEMS = %w(user_id=, color=)
  #   
  #   REQUIRED_ITEMS.each do |req|
  #     
  #     it "when #{req} is not present" do
  #       puts @bag.inspect
  #       @bag.send(req.to_sym, nil)
  #       @bag.should_not be_valid
  #     end  
  #     
  #   end
  #   
  # end

  describe "when user_id is not present" do
    before { @bag.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "when color is not present" do
    before { @bag.color = nil }
    it { should_not be_valid }
  end

  describe "when brand is not present" do
    before { @bag.brand = nil }
    it { should_not be_valid }
  end

  describe "when condition is not present" do
    before { @bag.condition = nil }
    it { should_not be_valid }
  end

  describe "when size is not present" do
    before { @bag.size = nil }
    it { should_not be_valid }
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

  describe "when brand is not present" do
    before { @bag.price_paid = nil }
    it { should_not be_valid }
  end

  describe "when condition is not present" do
    before { @bag.button_cost = nil }
    it { should_not be_valid }
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
