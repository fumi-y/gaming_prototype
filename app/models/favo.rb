class Favo < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :iine

  with_options presence: true do
    validates :iine_id, numericality: { other_than: 0 } 
  end
end
