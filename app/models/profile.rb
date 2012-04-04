class Profile < ActiveRecord::Base
  attr_accessible :buckle_count, :first_name, :last_name
  
  belongs_to :user
  
  validates_presence_of :user_id
end
