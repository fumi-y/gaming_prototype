class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: 'アクション' },
    { id: 2, name: 'シューティング' },
    { id: 3, name: 'シュミレーション' },
    { id: 4, name: 'レーシング' },
    { id: 5, name: 'アドベンチャー' },
    { id: 6, name: 'ロールプレイング' },
    { id: 7, name: 'パズル' },
    { id: 8, name: '音楽' },
    { id: 9, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :prototypes
end