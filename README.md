# README

## users テーブル

| Column                     | Type       | Options                  |
| ---------------------------| -----------| -------------------------|
| nickname                   | string     | null: false              |
| email                      | string     | null: false, unique:true |
| encrypted_password         | string     | null: false              |
| last_name                  | string     | null: false              |
| first_name                 | string     | null: false              |
| last_name_kanacharacters   | string     | null: false              |
| first_name_kanacharacters  | string     | null: false              |
| birthday                   | date       | null: false              |
  
### Association

-has_many :items
-has_many :buys


## items テーブル 

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| item_name              | string     | null: false                    |
| description_of_item    | text       | null: false                    |
| item_category_id       | integer    | null: false                    |
| item_state_id          | integer    | null: false                    |
| shipping_charge_id     | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| days_to_delivery_id    | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :buy


## buys テーブル

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has_one :delivery

## deliverys テーブル

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| postcode               | string     | null: false                    |
| prefecture_id          | integer    | null: false                    |
| municipality           | string     | null: false                    |
| address                | string     | null: false                    |
| building_name          | string     |                                |
| telephone_number       | string     | null: false                    |
| buy                    | references | null: false, foreign_key: true |

### Association

-belongs_to :buy 