describe CompanyTransaction do
 
  let(:buyer) { FactoryGirl.create(:user) }
  let(:seller) { FactoryGirl.create(:user) }
  
  before do
    @button_purchase = buyer.button_purchases.new(:button_amount => 20,
                                                  :date => Time.now)
    @button_purchase.seller = seller                                 
  end
  
  subject { @button_purchase } 
  
  it { should be_valid }
  
  # describe "when feedback is not present" do
  #   before { @handbag_purchase.feedback = nil }
  #   it { @handbag_purchase.should_not be_valid }
  # end
  # 
  # describe "when bag_id is not present" do
  #   before { @handbag_purchase.bag_id = nil }
  #   it { @handbag_purchase.should_not be_valid }
  # end
  
end