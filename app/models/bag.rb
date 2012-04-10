class Bag < ActiveRecord::Base
  attr_accessible :approved, :brand, :button_cost, :color, :condition, :description, :price_paid, :size, :user_id
end
