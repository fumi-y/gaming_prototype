class Prototype < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favos

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :platform
  belongs_to :publish

  with_options presence: true do
    validates :name
    validates :concept
    validates :text
    validates :genre_id, numericality: { other_than: 0 } 
    validates :platform_id, numericality: { other_than: 0 } 
    validates :publish_id
    validates :image
  end
end
