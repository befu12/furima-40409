# テーフル設計

## users テーブル
| Column             | Type   | Options    |
| ------------------ | ------ | ---------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| name_first         | string | null: false |
| name_last          | string | null: false |
| name_first-reading | string | null: false |
| name_last-reading  | string | null: false |
| birthday           | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル
| Column      | Type       | Option      |
| ----------- | ---------- | ----------- |
| user        | references | null: false, foreign_key: true |
| name        | string     | null: false |
| category    | integer    | null: false |
| price       | string     | null: false |
| condition   | integer    | null: false |
| burden      | integer    | null: false |
| prefectures | integer    | null: false |
| estimate    | integer    | null: false |
| seller      | string     | null: false |

### Association

- belongs_to :users
- belongs_to :orders
- has_one_active_hash :category
- has_one_active_hash :condition
- has_one_active_hash :burden
- has_one_active_hash :prefectures
- has_one_active_hash :estimate

## orders テーブル
| Column     | Type       | Option     |
| ---------- | ---------- | ---------- |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| address    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :items
- belongs_to :address

## address テーブル
| Column        | Type       | Option      |
| ------------- | ---------- | ----------- |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefectures   | integer    | null: false, foreign_key: true |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |
| phone_num     | string     | null: false |

### Association

- has_one :order
- belongs_to_active_hash :prefectures