# README FURIMA_28335

## テーブル設計

### usersテーブル

| Column   | Type    | Options     |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| name     | string  |             |
| kana     | string  |             |
| birthday | integer |             |
#### Association

- has_many :items
- has_many :buys
- has_many :ships

### itemsテーブル

| Column      | Type       | Options                        |
| user_id     | references | null: false, foreign_key: true |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| state       | string     | null: false                    |
| charge      | string     | null: false                    |
| area        | string     | null: false                    |
| due         | string     | null: false                    |
| price       | integer    | null: false                    |

#### Association

- belongs_to :user
- has_one :buy

### buysテーブル

| Column  | Type       | Options                        |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |
| credit  | integer    | null: false                    |
| expire  | integer    | null: false                    |
| cvv     | integer    | null: false                    |

#### Association

- belongs_to :item
- belongs_to :user
- has_one :ship

### shipsテーブル

| Column  | Type       | Options                        |
| buy_id  | references | null: false, foreign_key: true |
| user_id | references | null: false, foreign_key: true |
| postal  | integer    | null: false                    |
| pref    | string     | null: false                    |
| city    | string     | null: false                    |
| number  | string     | null: false                    |
| house   | string     |                                |
| tel     | integer    | null: false                    |

#### Association

- belongs_to :user
- belongs_to :buy