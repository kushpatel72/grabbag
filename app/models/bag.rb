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
  attr_accessible :brand, :button_cost, :color, :condition, :description, :price_paid, :size
  
  belongs_to :user
  
  validates_presence_of :user
  validates_presence_of :color
  validates_presence_of :brand
  validates_presence_of :condition
  validates_presence_of :size
  validates_presence_of :price_paid
  validates_presence_of :button_cost
  
  validates_inclusion_of :size, :in => 1..3
end
