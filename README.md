# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| name               | string | null: false              |
| birth_date         | string | null: false              |


### アソシエーション

- has_many :items
- has_many :purchases


## items テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| item_name          | string     | null:false                    |
| information        | text       | null:false                    |
| category           | integer    | null:false                    |
| condition          | integer    | null:false                    |
| shipping_fee       | integer    | null:false                    |
| ship_from          | integer    | null:false                    |
| shipping_days      | integer    | null:false                    |
| price              | integer    | null:false                    |
| user_id            | references | null:false, foreign_key: true |



### アソシエーション

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| user_id            | references | null:false, foreign_key: true|
| item_id            | references | null:false, foreign_key: true|

### アソシエーション

- belongs_to :user
- belongs_to :item
- has_many :addresses

## addresses テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| post_code          | string     | null:false                    |
| prefecture         | integer    | null:false                    |
| city               | string     | null:false                    |
| house_number       | string     | null:false                    |
| building_name      | string     | null:false                    |
| phone_number       | string     | null:false                    |

### アソシエーション

- belongs_to :purchase
