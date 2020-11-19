class CreatePurchasers < ActiveRecord::Migration[6.0]
  def change
    create_table :purchasers do |t|
      t.string  :zip_code,                     null: false
      t.integer :area_id,                      null: false
      t.string  :city,                         null: false
      t.string  :street_number,                null: false
      t.string  :telephone_number,             null: false
      t.string  :building_number,              null: false
      t.integer :purchaser_history_id,         null: false
      t.timestamps
    end
  end
end
