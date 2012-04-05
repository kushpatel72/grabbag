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
#  feeback       :text
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

class Transaction < ActiveRecord::Base
  attr_accessible :bag_id, :button_amount, :date, :feeback, :seller_id, :type

  
  validates_presence_of :buyer_id
end
