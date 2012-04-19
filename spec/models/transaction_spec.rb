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
#  feedback      :text
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

require 'spec_helper'

describe Transaction do
  
  let(:buyer) { FactoryGirl.create(:user) }
  let(:seller) { FactoryGirl.create(:user) }
  
  # I don't think we ever need to do stuff through the seller
  # 
  # 
  # it "should let one create a transaction through the seller" do
  #   @sale = seller.sales.new(:button_amount => 20,
  #                            :date => Time.now)
  #   
  #   @sale.buyer = buyer
  #   @sale.should be_valid
  # end
  
  before do
    @transaction = buyer.purchases.new(:button_amount => 20, 
                                       :date => Time.now)
    @transaction.seller = seller                                  
  end
  
  subject { @transaction }
  
  it { should be_valid }
  
  describe "attribute presence" do
    
    REQUIRED_TRANSACTION_METHODS = [:buyer=, :seller=, :date=]
    
    REQUIRED_TRANSACTION_METHODS.each do |req|
      
      it "when #{req} is not present" do
        @transaction.send(req, nil)
        @transaction.should_not be_valid
      end  
      
    end
    
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
    
    it "should not allow access to bag_id" do
      expect do
        Transaction.new(:bag_id => 1)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end
  
end
