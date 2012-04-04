class Transaction < ActiveRecord::Base
  attr_accessible :bag_id, :button_amount, :buyer_id, :date, :feeback, :seller_id, :type
end
