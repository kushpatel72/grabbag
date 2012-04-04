require 'spec_helper'

describe Transaction do
  
  before do
    @transaction = Transaction.new(:buyer_id => 2, :seller_id => 1, 
                                   :button_amount => 20, :date => Time.now)
  end
  
  subject { @transaction }
  
  it { should be_valid }
  
  describe "when buyer_id is not present" do
    before { @transaction.buyer_id = nil }
    it { @transaction.should_not be_valid }
  end
  
  # it "Company transaction should have 1 as the seller_id"
  
end
