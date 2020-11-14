class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name
      t.text    :explanation
      t.integer :burden_id
      t.integer :product_condition_id
      t.integer :category_id
      t.integer :area_id
      t.integer :number_of_month_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
