class Publish < ActiveHash::Base
  self.data = [
    { id: 0, name: '公開' },
    { id: 1, name: '非公開' }
  ]
  include ActiveHash::Associations
  has_many :prototypes
end