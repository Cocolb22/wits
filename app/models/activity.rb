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

  has_many :favorite_activities, dependent: :destroy
  validates :icon, :description, presence: true
  validates :description, length: { minimum: 100 }
  validates :name, inclusion: {in: NAMES}, allow_blank: true
end
