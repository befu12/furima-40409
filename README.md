# テーフル設計

## users テーブル
| Column             | Type   | Options    |
| ------------------ | ------ | ---------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name_first         | string | null: false |
| name_last          | string | null: false |
| name_first_reading | string | null: false |
| name_last_reading  | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル
| Column         | Type       | Option      |
| -------------- | ---------- | ----------- |
| user           | references | null: false, foreign_key: true |
| photo          | text       | null: false |
| explanation    | text       | null: false |
| name           | string     | null: false |
| category_id    | integer    | null: false |
| number         | string     | null: false |
| condition_id   | integer    | null: false |
| burden_id      | integer    | null: false |
| prefecture_id  | integer    | null: false |
| estimate_id    | integer    | null: false |

### Association

- belongs_to :user
- has_many   :orders
- has_one_active_hash :category
- has_one_active_hash :condition
- has_one_active_hash :burden
- has_one_active_hash :prefectures
- has_one_active_hash :estimate

## orders テーブル
| Column     | Type    | Option                         |
| ---------- | --------| ------------------------------ |
| user       | integer | null: false, foreign_key: true |
| item       | integer | null: false, foreign_key: true |
| address    | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## address テーブル
| Column         | Type       | Option      |
| -------------- | ---------- | ----------- |
| order          | references | null: false, foreign_key: true |
| postal_code    | string     | null: false |
| prefecture_id | integer    | null: false, foreign_key: true |
| city           | string     | null: false |
| house_number   | string     | null: false |
| building_name  | string     |
| phone_num      | string     | null: false |

### Association

- belongs_to_active_hash :prefectures
- belongs_to             :order