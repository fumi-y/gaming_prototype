# _GamingPrototype_

## 概要
ゲームのあったらいいな  
こんなゲームおもしろそう  
新しいゲームの想像共有アプリ  

## 制作背景
ステイホームの時代で楽しく面白いゲームを想像し、クリエイターが思わず作りたくなるようなゲーム案をどんな人でも発信できるようにしたいから  

## 機能紹介
- ユーザー登録機能  
ユーザー登録制で機能の利用ができる。
- ゲーム案(prototype)投稿機能  
ログインユーザーのみが投稿できる。
- prototype詳細、編集、削除機能  
ユーザーが任意で編集、削除ができる。
- 非公開機能  
投稿したもの非公開にすることができる

## 実装予定の機能
- いいね！機能&ランキング機能  
他のユーザーがいいね！することができ、ランキング形式で表示させたい
- お気に入り機能  
各ユーザーのお気に入りをきめることができ、簡単に詳細ページに遷移できるようにする
- SNS認証  
Twitterなどのインフルエンサーであるアカウントと紐づける事で盛り上げたい
- AWS(S3)導入  
外部ストレージを利用する



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

開発履歴  
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

## 〜開発中思った事、今後実装したい機能など〜
- 