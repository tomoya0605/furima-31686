class Item < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_one :purchaser_history

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :burden
  belongs_to :category
  belongs_to :number_of_month
  belongs_to :product_condition
  belongs_to :area

  with_options presence: true do
    validates :name
    validates :explanation
    validates :images
    validates :price, numericality: { only_integer: true }
    validates :burden_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :category_id, numericality: { other_than: 1, message: 'を入力してください' }
    validates :number_of_month_id, numericality: { other_than: 0, message: 'を入力してください'}
    validates :product_condition_id, numericality: { other_than: 0, message: 'を入力してください' }
    validates :area_id, numericality: { other_than: 0, message: 'を入力してください' }
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
