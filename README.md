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
| japanese_text | string | null: false |
| user_address | string | null: false |

### Association
- has_many :　items

##  items テーブル

| Column | Type | Options |
| -| - | - |
| item_name | string | null:false |
| image | string | null:false |
| category | string | null:false |
| status | string | null : false |
| item_text | string | null:false |
| price | integer | null:false |
| user_id | string | null:false |
| item_id | string | null:false |
|item_address | string | null:false |

##  comments テーブル

| Column | Type | Options |
| - | - | - |
| user_id | string | null:false |
| item_id | string | null:false |

### Association
- has_many :　items

##  purchases テーブル

| Column | Type | Options |
| - | - | - |
| user_id | string | null:false |
| item_id | string | null:false |
|credit_card_information | string | null:false|
|user_address | string | null:false|

### Association
belongs_to :　users
