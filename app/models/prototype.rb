class Prototype < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :platform
  belongs_to :publish

  with_options presence: true do
    validates :name
    validates :concept
    validates :text
    validates :genre, numericality: { other_than: 0 } 
    validates :platform, numericality: { other_than: 0 } 
    validates :publish
    validates :user_id
  end
end
