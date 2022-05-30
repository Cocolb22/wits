class Activity < ApplicationRecord
  has_many :spot_activities, dependent: :destroy
  validates :name, :icon, :description, presence: true
  validates :description, length: { min: 100 }
end
