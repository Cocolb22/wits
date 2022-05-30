class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :spot
  has_many :likes, dependent: :destroy
  validates :content, :rating, presence: true
  validates :content, length: { maximum: 1000 }
  validates :rating, inclusion: { in: 0..5 }, numericality: true
end
