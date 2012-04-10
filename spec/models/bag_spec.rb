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

require 'spec_helper'

describe Bag do
  pending "add some examples to (or delete) #{__FILE__}"
end
