class CreatePurchaserHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :purchaser_histories do |t|
      t.integer :user_id,   null: false
      t.integer :item_id,   null: false
      t.timestamps
    end
  end
end
