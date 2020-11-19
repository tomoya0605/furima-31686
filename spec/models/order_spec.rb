require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入者情報' do
    before do
      @order = FactoryBot.build(:order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order).to be_valid
    end

    it '郵便番号が正しく記載されていないと保存できないこと' do
      @order.zip_code = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip code can't be blank")
    end
    it '郵便番号にハイフンが必要であること' do
      @order.zip_code = '0000000'
      @order.valid?
      expect(@order.errors.full_messages).to include("Zip code is invalid")
    end
    it '都道府県が正しく記載されていないと保存できないこと' do
      @order.area_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Area can't be blank")
    end
    it '市区町村が正しく記載されていないと保存できないこと' do
      @order.city = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が正しく記載されていないと保存できないこと' do
      @order.street_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Street number can't be blank")
    end
    it '電話番号が正しく記載されていないと保存できないこと' do
      @order.telephone_number = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number can't be blank")
    end
    it '電話番号にハイフンが不要であること' do
      @order.telephone_number = '090_0000_0000'
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number is invalid")
    end
    it '電話番号は11桁以内でないと保存できないこと' do
      @order.telephone_number = '000000000000'
      @order.valid?
      expect(@order.errors.full_messages).to include("Telephone number is invalid")
    end
    it 'tokenが空では登録できないこと' do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
  end
end
