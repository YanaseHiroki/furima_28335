# README FURIMA_28335

## テーブル設計

### usersテーブル

| Column   | Type   | Options     |
| email    | string | null: false |
| password | string | null: false |
| nickname | string | null: false |
| name_1   | string | null: false |
| name_2   | string | null: false |
| kana_1   | string | null: false |
| kana_2   | string | null: false |
| birthday | date   | null: false |

#### Association

- has_many :items
- has_many :buys

### itemsテーブル

| Column      | Type       | Options                        |
| user        | references | null: false, foreign_key: true |
| title       | string     | null: false                    |
| image       | string     | null: false                    |
| description | text       | null: false                    |
| category_id | integer    | null: false                    |
| state_id    | integer    | null: false                    |
| charge_id   | integer    | null: false                    |
| area_id     | integer    | null: false                    |
| due_id      | integer    | null: false                    |
| price       | integer    | null: false                    |
| star        | integer    | null: false                    |

#### Association

- belongs_to :user
- has_one :buy

### buysテーブル

| Column | Type       | Options                        |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

#### Association

- belongs_to :item
- belongs_to :user
- has_one :ship

### shipsテーブル

| Column  | Type       | Options                        |
| buy     | references | null: false, foreign_key: true |
| postal  | string     | null: false                    |
| pref_id | integer    | null: false                    |
| city    | string     | null: false                    |
| number  | string     | null: false                    |
| house   | string     |                                |
| tel     | string     | null: false                    |

#### Association

- belongs_to :buy