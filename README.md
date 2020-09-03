# README フリマアプリ FURIMA_28335

## 概要
このフリマアプリでは、誰でも商品を出品できます！
そして、誰でも好きな商品を購入できます！
### このアプリでできること
- いらなくなったものは写真をとって出品！
- 他の出品者の商品をクレジットカード決済でカンタン購入！

## 本番環境(デプロイ先　テストアカウント＆ID)
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

出品した商品の画像が次の日以降も表示されるように、画像のデータをAWS S3に保存します。

## 使用技術(開発環境)

- macOS Catalina 10.15.6
- ruby 2.6.5
- Rails 6.0.3.2

## 課題や今後実装したい機能

- キーワードで出品されている商品を検索する
- 購入後の取引をする画面
- "取引中の商品の一覧を表示する。
- 取引の進捗と、To Doが表示される。
- 取引画面で出品者と購入者がチャット形式で連絡をとる。
- 商品に「お気に入り」をする
- 「お気に入り」一覧を表示する
- 取引画面で出品者と購入者がチャット形式で連絡をとる。
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

## ローカルでの動作方法
お手元のローカル環境で動作させるためには、次のコマンドを実行してください。
1. カレントディレクトリを複製先のディレクトリに移動します
（例：projectsフォルダー配下に複製する場合）
```
% cd ~/projects
```
2. リモートリポジトリをローカル環境に複製します
```
% git clone https://https://github.com/YanaseHiroki/furima_28335
```
3. 複製されたディレクトリに移動します
```
% cd furima_28335 
```
4. "Gemfile"に記述されたGemをインストールします
```
% bundle install
```
5. "yarn.lock"に記述されたパッケージをインストールします
```
% yarn install
```
6. データベースを新規作成します
```
% rails db:create
```
7. マイグレーションファイルを実行します
```
% rails db:migrate
```
8. ローカルサーバーを立ち上げます
```
rails s
```
9. ブラウザでアプリケーションを開きます
```
open "http://localhost:3000"
```