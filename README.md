## usersテーブル

| Column               | Type       | Options                     |
| -------------------- | ---------- | ----------------------------|
| name                 | string     | null: false                 |
| email                | string     | null: false, unique:true    |
| encrypted_password   | string     | null: false                 |
| first_name           | string     | null: false                 |
| last_name            | string     | null: false                 |
| first_kana           | string     | null: false                 |
| last_kana            | string     | null: false                 |
| birth                | date       | null: false                 |

## Association
-has_many :items
-has_many :purchases

## itemsテーブル

| Column        | Type          | Options           |
| ------------- | ------------- | ------------------|
| name          | string        | null:false        |
| text          | text          | null: false       |
| category_id   | integer       | null: false       | 
| status_id     | integer       | null: false       | 
| charge_id     | integer       | null: false       | 
| area_id       | integer       | null: false       | 
| indication_id | integer       | null: false       | 
| price         | integer       | null:false        |
| user          | references    | foreign_key: true |

## Association
-belong_to :user
-has_one :purchase


## purchasesテーブル
| Column     | Type          | Options           |
| ---------- | ------------- | ----------------- |
| user       | references    | foreign_key: true |
| item       | references    | foreign_key: true |


## Association
-belongs_to :user
-belongs_to :item
-has_one :address


## addressesテーブル

| Column      | Type          | Options           |
| ----------- | ------------- | ----------------- |
| deli_num    | string        | null: false       |
| area_id     | integer       | null: false       |
| block       | string        | null: false       |
| room        | string        |                   |
| phone       | string        | null: false       | 
| purchase    | references    | foreign_key: true |


## Association
-belong_to :purchase