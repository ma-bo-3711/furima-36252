## usersテーブル

| Column               | Type       | Options        |
| -------------------- | ---------- | ---------------|
| email                | string     | null: false    |
| encrypted_password   | string     | null: false    |
| name                 | string     | null: false    | 
| profile              | text       |                |

## Association
-has_many :items
-has_many :address
-has_many :purchase

## itemsテーブル

| Column     | Type          | Options        |
| ---------- | ------------- | ---------------|
| image      | ActiveStorage | null: false    |
| text       | text          | null: false    |
| category   | string        | null: false    |
| status     | string        | null: false    |
| charge     | string        | null: false    |
| area       | string        | null: false    |
| indication | string        | null: false    |
| user_id    | references    |                |

## Association
-belong_to :users
-has_one :purchase


## purchaseテーブル
| Column     | Type          | Options        |
| ---------- | ------------- | ---------------|
| number     | string        | null: false    |
| limit      | string        | null: false    |
| code       | string        | null: false    |
| user_id    | references    |                |
| item_id    | references    |                |


## Association
-has_one :address
-has_one :items


## addressテーブル

| Column     | Type          | Options        |
| ---------- | ------------- | ---------------|
| deli_num   | string        | null: false    |
| prefecture | string        | null: false    |
| ward       | string        | null: false    |
| block      | string        | null: false    |
| room       | string        |                |
| phone      | string        | null: false    |
| user_id    | references    |                |


## Association
-belong_to :users
-has_one :purchase