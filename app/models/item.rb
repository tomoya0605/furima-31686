class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :number_of_month
  belongs_to :product_condition
  belongs_to :area
  
  with_options presence: true do
    validates :name
    validates :explanation
    validates :image
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
    validates :burden_id, numericality: { other_than: 1, message: "Select." } 
    validates :category_id, numericality: { other_than: 1, message: "Select."  } 
    validates :number_of_month_id, numericality: { other_than: 0, message: "Select." } 
    validates :product_condition_id, numericality: { other_than: 0, message: "Select." } 
    validates :area_id, numericality: { other_than: 0, message: "Select." } 
  end
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
end
