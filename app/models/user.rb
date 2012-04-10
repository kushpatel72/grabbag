# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  first_name             :string(255)
#  last_name              :string(255)
#  button_count           :integer
#  database_authenticable :boolean
#  confirmable            :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name
  
  has_many :purchases, :class_name => 'Transaction', :foreign_key => :buyer_id
  has_many :sales, :class_name => 'Transaction', :foreign_key => :seller_id
  has_many :handbag_purchases, :class_name => 'UserTransaction', :foreign_key => :buyer_id  
  has_many :button_purchases, :class_name => 'CompanyTransaction', :foreign_key => :buyer_id  
  
    
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_length_of :first_name, :maximum => 50
  validates_length_of :last_name, :maximum => 50
    
end
