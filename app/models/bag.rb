# == Schema Information
#
# Table name: bags
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  approved    :boolean
#  color       :string(255)
#  description :text
#  brand       :string(255)
#  condition   :integer
#  size        :integer
#  price_paid  :integer
#  button_cost :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Bag < ActiveRecord::Base
  attr_accessible :approved, :brand, :button_cost, :color, :condition, :description, :price_paid, :size, :user_id
end
