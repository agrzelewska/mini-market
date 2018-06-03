class Customer < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, 
                    uniqueness: true, 
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+.)+[a-z]{2,})\z/i }
  has_many :offers

  has_secure_password
  validates :password_digest, presence: true, 
  					   length: { minimum: 6}
end
