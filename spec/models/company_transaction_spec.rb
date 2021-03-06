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
  
end
