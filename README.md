# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :purchasers




## items テーブル

 Column              | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| explanation        | text    | null: false                    |
| burden_id          | integer | null: false                    |
|product_condition_id| integer | null: false                    |
| category_id        | integer | null: false                    |
| area_id            | integer | null: false                    |
| number_of_month_id | integer | null: false                    |
| price              | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :purchaser_history




## purchaser_history テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | integer    | null: false, foreign_key: true |
| item_id | integer    | null: false, foreign_key: true |

### Association

- belongs_to   :user
- belongs_to   :item
- has_one      :purchaser





## purchasers テーブル
 Column              | Type   | Options     |
| ------------------ | ------ | ----------- |
| zip_code           | string | null: false |
| city               | string | null: false |
| street_number      | string | null: false |
| telephone_number   | string | null: false |
| building_number    | string |             |
| address            | string | null: false |
| area_id            | integer| null: false |
### Association

- belongs_to :purchaser_history




