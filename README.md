## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    | 

### Association

has_many :travels


## prefectures テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |

### Association

- has_many :travels


## travels テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null: false                    |
| check_in           | date       | null: false                    |
| check_out          | date       | null: false                    |
| partner            | string     | null: false                    |
| price              | integer    | null: false                    |
| travel_site        | integer    | null: false                    |
| content            | text       | null: false                    |
| user               | references | null: false, foreign_key: true | 
| prefecture        | references | null: false, foreign_key: true | 

### Association

- belongs_to :user
- belongs_to :prefecture