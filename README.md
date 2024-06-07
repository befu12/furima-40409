# テーフル設計

## users テーブル
| Column       | Type   | Options    |
| ------------ | ------ | ---------- |
| nickname     | string | null: false |
| email        | string | null: false, unique: true |
| password     | string | null: false |
| name         | string | null: false |
| name_reading | string | null: false |

## items テーブル
| Column    | Type       | Option     |
| --------- | ---------- | ---------- |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |
| name      | text       | null: false |
| category  | text       | null: false |
| price     | string     | null: false |
| condition | string     | null: false |
| burden    | string     | null: false |
| local     | string     | null: false |
| estimate  | string     | null: false |
| seller    | string     | null: false |

## orders テーブル
| Column     | Type       | Option     |
| ---------- | ---------- | ---------- |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |
| address    | references | null: false, foreign_key: true |
| card_num   | string     | null: false |
| card_limit | string     | null: false |
| card_code  | string     | null: false |


## address テーブル
| Column        | Type       | Option      |
| ------------- | ---------- | ----------- |
| orders        | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefecture    | integer    | null: false |
| city          | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     | null: false |
| phone_num     | string     | null: false |