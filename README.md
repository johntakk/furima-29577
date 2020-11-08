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

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| email                   | string | null: false |
| encrypted_password      | string | null: false |
| family_name_jp_kanji    | string | null: false |
| first_name_jp_kanji     | string | null: false |
| family_name_jp_katakana | string | null: false |
| birthday　　　           | date   | null: false |

### users Association
- has_many :items
- has_many :comments

## items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| name                | string | null: false |
| description         | text | null: false |
| category            | string | null: false |
| condition           | string | null: false |
| delivery_term_id       | integer | null: false |
| delivery_area_id       | integer | null: false |
| delivery_estimate_id   | integer | null: false |
| price               | integer | null: false |

### items Association
- belongs_to : users

## comments テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| users   | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### items Association
- belongs_to : users

## purchases テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| card_num            | integer | null: false |
| card_valid          | integer | null: false |
| card_security_num   | integer | null: false |
| postal_code         | integer| null: false |
| prefecture          | string | null: false |
| city                | string | null: false |
| detail_address      | string | null: false |
| tel_num             | integer | null: false |

### purchases Association
