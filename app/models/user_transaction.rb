class UserTransaction < Transaction
  
  validates_presence_of :feedback
  validates_presence_of :bag_id
  
end