# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :items
- has_many :purchaser

## items テーブル

 Column              | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| price              | string  | null: false                    |
| explanation        | text    | null: false                    |
| burden_id          | integer | null: false                    |
| area_id            | integer | null: false                    |
| number_of_month_id | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchaser


## purchaser テーブル
 Column              | Type   | Options     |
| ------------------ | ------ | ----------- |
| zip_code           | string | null: false |
| city               | string | null: false |
| street_number      | string | null: false |
| telephone_number   | string | null: false |
| building_number    | string | null: false |
| adless             | string | null: false |
| area_id            | integer| null: false |
### Association

- belongs_to :user
- has_one :items
- has_one :purchaser_history


## purchaser_history テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | integer    | null: false, foreign_key: true |
| item_id | integer    | null: false, foreign_key: true |

### Association

- has_one :purchaser


