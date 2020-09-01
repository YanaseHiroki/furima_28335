# README フリマアプリ FURIMA_28335

## 概要
このフリマアプリでは、誰でも商品を出品できて、好きな商品を購入できます！
### このアプリでできること
- いらなくなったものは写真をとって出品！
- 他の出品者の商品をクレジットカード決済でカンタン購入！

## 本番環境(デプロイ先　テストアカウント＆ID)
テストアカウントなどです！
| 項目  | 情報 |
| --  | --  |
| 自身のフリマアプリのURL | https://furima-28335.herokuapp.com/ |
| Basic認証のID |  administrator |
| Basic認証のパスワード |  31415926535 |
| 出品者用のメールアドレス | sample@sample.com |
| 出品者用のパスワード | sample123 |
| 購入者用のメールアドレス | test@test.com |
| 購入者用のパスワード | test123 |
| 購入用カードの番号 | 4242424242424242 |
| 購入用カードの期限 | 2024年12月 ( 12 24 の順に入力) |
| 購入用カードのセキュリティコード | 123 |


## 制作背景(意図)

「いらなくなったものを整理したい」「欲しいものを定価より安く買いたい」
というユーザーの課題を解決するために、このアプリケーションを作成しました。

## DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)

## how to work
- [ログアウト状態ならログイン画面にリダイレクトする](https://gyazo.com/7d31bfccbc1c3c539ecc3b6aa51cdbc1)
- [ログイン状態なら出品ページに遷移できる](https://gyazo.com/38536edc7ba20d85f9542084a109dc2b)
- [商品を削除する](https://gyazo.com/9384d7cde4bd34fb4255bdddc53878bc)
- [商品を編集する](https://gyazo.com/b4579251c3a30e36783201a1b7ae9149)
- [商品購入画面で購入する動画](https://gyazo.com/1e58a1099dff128c92bde51520752846)

## 工夫したポイント

最終課題の達成要件を満たした後の追加実装をあらかじめ想定してテーブルのカラムを作成しました。

## 使用技術(開発環境)

- macOS Catalina 10.15.6
- ruby 2.6.5
- Rails 6.0.3.2

## 課題や今後実装したい機能

- キーワードで検索する
- 購入後の取引をする画面
- 購入前の商品にコメントをする
- 商品に「お気に入り」をする
- 「お気に入り」一覧を表示する
- ユーザーの趣味にあった商品をトップページに表示する

## テーブル設計

### usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| name_1             | string | null: false |
| name_2             | string | null: false |
| kana_1             | string | null: false |
| kana_2             | string | null: false |
| birthday           | date   | null: false |

#### Association

- has_many :items
- has_many :buys

### itemsテーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| user_id     | integer | null: false, foreign_key: true |
| title       | string  | null: false                    |
| image       | string  | null: false                    |
| description | text    | null: false                    |
| category_id | integer | null: false                    |
| state_id    | integer | null: false                    |
| charge_id   | integer | null: false                    |
| pref_id     | integer | null: false                    |
| due_id      | integer | null: false                    |
| price       | integer | null: false                    |
| star        | integer | null: false                    |

#### Association

- belongs_to :user
- has_one :buy

### buysテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

#### Association

- belongs_to :item
- belongs_to :user
- has_one :ship

### shipsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| buy     | references | null: false, foreign_key: true |
| postal  | string     | null: false                    |
| pref_id | integer    | null: false                    |
| city    | string     | null: false                    |
| number  | string     | null: false                    |
| house   | string     |                                |
| tel     | string     | null: false                    |

#### Association

- belongs_to :buy
