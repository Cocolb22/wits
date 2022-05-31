class Activity < ApplicationRecord
  NAMES = [
    "Surf",
    "Kitesurf",
    "Kayak",
    "Saut depuis une falaise",
    "Planche à voile",
    "Plongée en apnée",
    "Catamaran",
    "Jetski"
  ]

  has_many :spot_activities, dependent: :destroy
  validates :name, :icon, :description, presence: true
  validates :description, length: { minimum: 100 }
end
