## usersテーブル

| Column               | Type       | Options        |
| -------------------- | ---------- | ---------------|
| name                 | string     | null: false    |
| email                | string     | unique:true    |
| encrypted_password   | string     | null: false    |
| first_name           | string     | null: false    |
| last_name            | string     | null: false    |
| first_kana           | string     | null: false    |
| last_kana            | string     | null: false    |
| year_id              | integer    | null: false    |
| month_id             | integer    | null: false    |
| day_id               | integer    | null: false    |

## Association
-has_many :items
-has_many :purchases

## itemsテーブル

| Column        | Type          | Options        |
| ------------- | ------------- | ---------------|
| name          | string        | null:false     |
| text          | text          | null: false    |
| category_id   | integer       | null: false    | 
| status_id     | integer       | null: false    | 
| charge_id     | integer       | null: false    | 
| area_id       | integer       | null: false    | 
| indication_id | integer       | null: false    | 
| price         | string        | null:false     |
| user          | references    |                |

## Association
-belong_to :users
-has_one :purchases


## purchasesテーブル
| Column     | Type          | Options           |
| ---------- | ------------- | ----------------- |
| number     | string        | null: false       |
| limit      | string        | null: false       |
| code       | string        | null: false       |
| user       | references    | foreign_key: true |
| item       | references    | foreign_key: true |


## Association
-has_one :addresses


## addressesテーブル

| Column      | Type          | Options           |
| ----------- | ------------- | ----------------- |
| deli_num    | string        | null: false       |
| area_id     | integer       | null: false       | 
| ward        | string        | null: false       |
| block       | string        | null: false       |
| room        | string        |                   |
| phone       | string        | null: false       |
| user        | references    | foreign_key: true |


## Association
-belong_to :purchases