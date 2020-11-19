class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :city, :street_number, :telephone_number, :building_number, :area_id, :purchaser_history_id, :token

  VALID_PHONE_NUMBER_REGEX = /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0-?\d{4}-?\d{4}\z/.freeze

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :zip_code, format: { with: /\A\d{3}-\d{4}\z/, message: '郵便番号を入力してください' }
    validates :area_id
    validates :city
    validates :street_number
    validates :telephone_number, format: { with: VALID_PHONE_NUMBER_REGEX, message: '電話番号を入力してください' }
    validates :token
  end

  def save
    purchaser_histories = PurchaserHistory.create(user_id: user_id, item_id: item_id)
    Purchaser.create(zip_code: zip_code, area_id: area_id, city: city, street_number: street_number, telephone_number: telephone_number, building_number: building_number, purchaser_history_id: purchaser_histories.id)
  end
end
