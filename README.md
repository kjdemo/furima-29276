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



## users テーブル

| Column | Type | Options |
| -| - | - |
| nick_name | string | null: false |
| email | string | null: false |
| password | string | null: false |
| first_name | string | null: false |
| last_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
|birthday | date | null: false |
### Association
- has_many :　items

##  items テーブル

| Column | Type | Options |
| -| - | - |
| item_name | string | null:false |
| category | integer | null:false |
| status | integer | null : false |
| item_text | text | null:false |
| price | integer | null:false |
| user_id | integer | null:false , foreign_key: true|
| item_id | string | null:false |
|item_address | string | null:false |
|days_to_ship | integer | null:false |

##  purchases テーブル

| Column | Type | Options |
| - | - | - |
| user_id | string | null:false |
| item_id | string | null:false |

### Association
belongs_to :　users

## Shipping address
| Column | Type | Options |
| - | - | - |
| postcode | integer | null:false |
| prefecture | string | null:false |
| city | string | null:false |
| black | string | null:false |
| building | text |
| phone_number | integer | null:false |

### Association
belongs_to : purchases
belongs_to : items