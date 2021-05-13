class Iine < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'とってもいいね！' },
    { id: 2, name: 'いいね！' },
    { id: 3, name: 'う〜ん。' }
  ]
  include ActiveHash::Associations
  has_many :favos
end