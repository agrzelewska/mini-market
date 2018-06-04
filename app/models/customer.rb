class Customer < ApplicationRecord
  has_many :offers
  
  validates :name, presence: true
  validates :email, presence: true, 
                    uniqueness: true, 
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }
  validates :password, presence: true, 
                       length: { minimum: 6}
  
  has_secure_password
end
