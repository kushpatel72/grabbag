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

class CompanyTransaction < Transaction
end
