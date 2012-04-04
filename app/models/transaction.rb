class Transaction < ActiveRecord::Base
  attr_accessible :bag_id, :button_amount, :date, :feeback, :seller_id, :type
  
  validates_presence_of :buyer_id
end
