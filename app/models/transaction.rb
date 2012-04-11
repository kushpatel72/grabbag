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

class Transaction < ActiveRecord::Base
  attr_accessible :button_amount, :date, :feedback, :type

  belongs_to :buyer, :class_name => 'User'
  belongs_to :seller, :class_name => 'User'
  
  validates_presence_of :buyer_id
  validates_presence_of :seller_id
  validates_presence_of :date
end
