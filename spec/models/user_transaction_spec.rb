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

describe UserTransaction do
 
  let(:buyer) { FactoryGirl.create(:user) }
  let(:seller) { FactoryGirl.create(:user) }
  
  before do
    @handbag_purchase = buyer.handbag_purchases.new(:button_amount => 20,
                                                    :date => Time.now,
                                                    :feedback => "Joe Blow was nice, but is that enough?")

    @handbag_purchase.seller = seller
    @handbag_purchase.bag_id = 1                                 
  end
  
  subject { @handbag_purchase } 
  
  it { should be_valid }
  
  describe "when feedback is not present" do
    before { @handbag_purchase.feedback = nil }
    it { @handbag_purchase.should_not be_valid }
  end

  describe "when bag_id is not present" do
    before { @handbag_purchase.bag_id = nil }
    it { @handbag_purchase.should_not be_valid }
  end
  
end
