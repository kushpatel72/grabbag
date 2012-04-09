# == Schema Information
#
# Table name: transactions
#
#  id            :integer         not null, primary key
#  buyer_id      :integer
#  seller_id     :integer
#  button_amount :integer
#  date          :datetime
#  type          :string(255)
#  bag_id        :integer
#  feedback       :text
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

require 'spec_helper'

describe Transaction do
  
  let(:buyer) { FactoryGirl.create(:user) }
  let(:seller) { FactoryGirl.create(:user) }
  
  it "should let one create a transaction through the seller" do
    @sale = seller.sales.new(:button_amount => 20,
                             :date => Time.now)
    
    @sale.buyer = buyer
    @sale.should be_valid
  end
  
  before do
    @transaction = buyer.purchases.new(:button_amount => 20, 
                                       :date => Time.now)
    @transaction.seller = seller                                  
  end
  
  subject { @transaction }
  
  it { should be_valid }
  
  describe "when buyer_id is not present" do
    before { @transaction.buyer = nil }
    it { @transaction.should_not be_valid }
  end
  
  describe "when seller_id is not present" do
    before { @transaction.seller = nil }
    it { @transaction.should_not be_valid }
  end
  
  describe "accessible attributes" do
    it "should not allow access to seller_id" do
      expect do
        Transaction.new(:seller_id => seller.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
    
    it "should not allow access to buyer_id" do
      expect do
        Transaction.new(:buyer_id => buyer.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
  
  
end
