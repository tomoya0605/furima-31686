# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :purchaser

## items テーブル

 Column              | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| name               | string  | null: false                    |
| image              | string  | null: false                    |
| burden             | string  | null: false                    |
| explanation        | text    | null: false                    |
| area               | string  | null: false                    |
| number_of_month    | string  | null: false                    |
| price              | string  | null: false                    |
| user_id            |reference| null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchaser


## purchaser テーブル
 Column              | Type   | Options     |
| ------------------ | ------ | ----------- |
| zip_code           | string | null: false |
| prefectures        | string | null: false |
| municipality       | string | null: false |
| street_number      | string | null: false |
| telephone_number   | string | null: false |

### Association

- belongs_to :user
- has_one :items
- has_one :purchaser_history


## purchaser_history テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- has_one :purchaser


