# _GamingPrototype_

## アプリケーション概要
ゲームのあったらいいな  
こんなゲームおもしろそう  
新しいゲームの想像共有アプリ  

## 制作背景
ステイホームの時代で楽しく面白いゲームを想像し、クリエイターが思わず作りたくなるようなゲーム案をどんな人でも発信できるようにしたいから  

## 機能紹介
- ユーザー登録機能  
( ユーザー登録制で機能の利用ができる。登録なしでも閲覧可能。)
- ゲーム案(prototype)投稿機能  
( 投稿を気軽にできるようにユーザー登録の制限を少なくした。)
- prototype詳細、編集、削除機能  
( ユーザーが任意で編集、削除ができる。)
- 非公開機能  
( 投稿したもの非公開にすることができる。)
- コメント機能  
( 投稿されたものにコメントを送信、閲覧ができる。コメントはユーザー登録した状態のみ閲覧できる)
- google認証機能  
( googleアカウントでログインできることによって、ユーザー登録を簡単にできる。)
- ユーザー情報詳細閲覧機能
( ユーザー毎のプロフィールや投稿を見れる。)

## 実装予定の機能
- いいね！機能&ランキング機能  
( 他のユーザーがいいね！することができ、ランキング形式で表示させたい。)
- お気に入り機能  
( 各ユーザーのお気に入りをきめることができ、簡単に詳細ページに遷移できるようにする。)
- AWS(S3)導入  
( 外部ストレージを利用する。)

## URL
https://gaming-prototype.herokuapp.com/  
*Basic認証 [ユーザー名: admin, パスワード: 2222]

## 開発環境
* HTML/CSS
* Javascript
* MySQL
* Ruby 2.6.5
* Ruby on Rails 6.0.3

## 開発履歴  
- 2021-04-29 開発開始
- 2021-04-29 デブロイ、Basic認証導入
- 2021-04-30 ユーザー登録機能、実装
- 2021-05-03 prototype投稿機能、実装
- 2021-05-03 prototype詳細機能、実装
- 2021-05-03 prototype編集機能、実装
- 2021-05-03 prototype削除機能、実装
- 2021-05-04 prototype非公開機能、実装
- 2021-05-07 コメント機能、実装（非同期通信での実装）
- 2021-05-08 ビューファイル調整
- 2021-05-10 google認証でのログイン機能、実装
- 2021-05-13 いいね！機能&お気に入り機能、開発中

## 〜開発中思った事、今後実装したい機能など〜
- 今回の開発環境では取り入れていないのですが、「Docker」を導入してアプリケーションの開発をしてみたいです。チームでの開発を理解したいからです。
- Ruby on RailsにおいてのMVCの理解をもっと深めたい。
- フロント言語との互換性、HTTP通信について学習する必要があると思った。


## DB設計

### users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| profile  | string | null: false |

#### Association
- has_many :prototypes
- has_many :comments

### prototype テーブル

| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| name        | string     | null: false       |
| concept     | string     | null: false       |
| text        | string     | null: false       |
| genre_id    | integer    | null: false       |
| platform_id | integer    | null: false       |
| publish_id  | integer    | null: false       |
| user        | references | foreign_key: true |
| image       |            |                   |

#### Association
- belongs_to :user
- has_many   :comments


### comment テーブル

| Column    | Type       | Options           |
| --------- | ---------- | ----------------- |
| comment   | text       | null: false       |
| user      | references | foreign_key: true |
| prototype | references | foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :prototype
