# README

## users テーブル

| Column                     | Type       | Options                  |
| ---------------------------| -----------| -------------------------|
| nickname                   | string     | null: false              |
| email                      | string     | null: false, unique:true |
| encrypted_password         | string     | null: false              |
| last_name                  | string     | null: false              |
| first_name                 | string     | null: false              |
| last_name(Kana characters) | string     | null: false              |
| first_name(Kana characters)| string     | null: false              |
| birthday                   | integer    | null: false              |

### Association

-has_many :items
-has_many :buys
-has_one :deliverys


## items テーブル

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| item_name              | string     | null: false                    |
| description_of_item    | text       | null: false                    |
| item_category          | integer    | null: false                    |
| postcode               | integer    | null: false                    |
| prefectures            | string     | null: false                    |
| municipalities         | string     | null: false                    |
| address                | string     | null: false                    |
| building_names         | string     |                                |
| telephone_number       | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-has_one :buys
-has_one :deliverys


## buys テーブル

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-has-one : deliverys

## deliverys テーブル

| Column                 | Type       | Options                        |
| -----------------------| -----------| -------------------------------|
| postcode               | integer    | null: false                    |
| prefectures            | string     | null: false                    |
| municipalities         | string     | null: false                    |
| address                | string     | null: false                    |
| building_names         | string     |                                |
| telephone_number       | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |
| buys                   | references | null: false, foreign_key: true |

### Association

-belongs_to :user
-belongs_to :item
-belongs_to :buy