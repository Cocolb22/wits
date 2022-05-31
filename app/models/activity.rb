class Activity < ApplicationRecord
  has_many :spot_activities, dependent: :destroy
  validates :name, :icon, :description, presence: true
  validates :description, length: { minimum: 100 }
 
end
