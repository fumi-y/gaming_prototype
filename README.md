# _GamingPrototype_

## 概要
ゲームのあったらいいな  
こんなゲームおもしろそう  
新しいゲームの想像共有アプリ  

## 制作背景
ステイホームの時代で楽しく面白いゲームを想像し、クリエイターが思わず作りたくなるようなゲーム案をどんな人でも発信できるようにしたいから  

## 実装予定の内容
1. ユーザー登録機能  
ユーザー登録制にして、SNS認証やランキング機能を付け加えたい
2. ゲーム案(prototype)投稿機能  

3. prototype詳細、編集、削除機能  
ユーザーが任意で編集、削除ができるようにする
4. 非公開機能  
見せたくないものを隠す機能
5. いいね！機能&ランキング機能  
他のユーザーがいいね！することができ、ランキング形式で表示させる
6. お気に入り機能  
各ユーザーのお気に入りをきめることができ、簡単に詳細ページに遷移できるようにする
7. SNS認証  
Twitterなどのインフルエンサーであるアカウントと紐づける事で盛り上げたい
8. AWS(S3)導入  
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

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| name        | string     | null: false                    |
| concept     | string     | null: false                    |
| text        | string     | null: false                    |
| genre_id    | integer    | null: false                    |
| platform_id | integer    | null: false                    |
| publish_id  | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| image       |            |                                |

#### Association
- belongs_to :user
- has_many   :comments


### comment テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | string     | null: false                    |
| user      | references | null: false, foreign_key: true |
| prototype | references | null: false, foreign_key: true |

#### Association
- belongs_to :user
- belongs_to :prototype

開発メモ  
- 2021-4-29 デブロイ、Basic認証導入