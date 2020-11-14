require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品登録' do
    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
    it '商品の説明が必須であること' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it 'カテゴリーの情報が必須であること' do
      @item.category_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it 'カテゴリーの選択が --- の時' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category Select.")
    end
    it '商品の状態についての情報が必須であること' do
      @item.product_condition_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition can't be blank")
    end
    it '商品の状態の選択が --- の時' do
      @item.product_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Product condition Select.")
    end
    it '配送料の負担についての情報が必須であること' do
      @item.burden_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden can't be blank")
    end
    it '配送料の負担の選択が --- の時' do
      @item.burden_id= 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Burden Select.")
    end
    it '発送元の地域についての情報が必須であること' do
      @item.area_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Area can't be blank")
    end
    it '発送元の地域の選択が --- の時' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Area Select.")
    end
    it '発送までの日数についての情報が必須であること' do
      @item.number_of_month = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Number of month can't be blank")
    end
    it '発送までの日数の選択が --- の時' do
      @item.number_of_month_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Number of month Select.")
    end
    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '価格の範囲が、¥300~¥9,999,999の間であること' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it '価格の範囲が299円以下の時' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it '価格の範囲が10000000円以上の時' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = "２０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
    end
  end
end
