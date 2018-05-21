class CreateOffers < ActiveRecord::Migration[5.2]
  def change
    create_table :offers do |t|
      t.float :suggested_price
      t.text :other

      t.timestamps
    end
  end
end
