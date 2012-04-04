require 'spec_helper'

describe Transaction do
  
  let(:user) { FactoryGirl.create(:user) }
  before do
    @transaction = user.transactions.new(:buyer_id => 2, 
                                         :seller_id => 1, 
                                         :button_amount => 20, 
                                         :date => Time.now)
  end
  
  subject { @transaction }
  
  it { should be_valid }
  
  describe "when buyer_id is not present" do
    before { @transaction.buyer_id = nil }
    it { @transaction.should_not be_valid }
  end
  
  describe "accessible attributes" do
  end
  
end
