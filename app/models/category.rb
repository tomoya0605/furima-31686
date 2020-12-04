class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' }, { id: 2, name: 'フランス' }, { id: 3, name: 'イタリア' },
    { id: 4, name: 'スペイン' }, { id: 5, name: 'ドイツ' }, { id: 6, name: 'アメリカ' },
    { id: 7, name: 'オーストラリア' }, { id: 8, name: 'ニュージーランド' }, { id: 9, name: 'アルゼンチン' },
    { id: 10, name: 'チリ' }, { id: 11, name: '日本' }, { id: 12, name: 'その他'}
  ]
  include ActiveHash::Associations
  has_many :items
  has_many :products
end
