class Offer < ApplicationRecord
  suggested_price: float
  status :x
  other: text
  belongs_to: Product
  belongs_to: Merchant

  def initialize
    @x= "proposed"
  end 
end
