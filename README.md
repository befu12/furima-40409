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
- has_one :address

## items テーブル
| Column    | Type       | Option      |
| --------- | ---------- | ----------- |
| user      | references | null: false, foreign_key: true |
| name      | string     | null: false |
| category  | text       | null: false |
| price     | string     | null: false |
| condition | string     | null: false |
| burden    | string     | null: false |
| local     | string     | null: false |
| estimate  | string     | null: false |
| seller    | string     | null: false |

### Association

- belongs_to :users
- belongs_to :orders
- belongs_to :address

## orders テーブル
| Column     | Type       | Option     |
| ---------- | ---------- | ---------- |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| address    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many   :items
- has_one    :address

## address テーブル
| Column        | Type       | Option      |
| ------------- | ---------- | ----------- |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| local         | string     | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     | null: false |
| phone_num     | string     |

### Association

- belongs_to :users
- has_many   :items
- belongs_to :orders