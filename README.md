# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments
<!-- - has_many :rooms, through: room_users -->

## prototypes テーブル

| Column     | Type               | Options     |
| ---------- | ------------------ | ----------- |
| title      | string             | null: false |
| catch_copy | text               | null: false |
| concept    | text               | null: false |
<!-- | image      | ActuveStorageで実装 | null: false | -->
| user       | references         | ----------- |

### Association

- belongs_to :user
- has_many :comments
<!-- - has_many :rooms, through: room_users -->

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| title     | text       | null: false |
| user      | references | ----------- |
| prototype | references | ----------- |
<!-- | prototype | references | null: false, foreign_key: true | -->

### Association

- belongs_to :user
- belongs_to :prototype
<!-- - has_many :rooms, through: room_users -->