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
| password                | string | null: false |
| password_confirmation   | string | null: false |
| family_name_jp_kanji    | string | null: false |
| first_name_jp_kanji     | string | null: false |
| family_name_jp_katakana | string | null: false |
| birthday_year           | integer | null: false |
| birthday_month          | integer | null: false |
| birthday_date           | integer | null: false |

### users Association
- has_many :items
- has_many :comments

## items テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| image               | string | null: false |
| name                | string | null: false |
| description         | text | null: false |
| category            | string | null: false |
| condition           | string | null: false |
| delivery_term       | string | null: false |
| delivery_area       | string | null: false |
| delivery_estimate   | string | null: false |
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
