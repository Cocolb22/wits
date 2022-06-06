class Activity < ApplicationRecord
  NAMES = [
    "Surf",
    "Kitesurf",
    "Kayak",
    "Saut de falaise",
    "Planche à voile",
    "Apnée",
    "Catamaran",
    "Jetski",
    "Char à voile"
  ]

  has_many :favorite_activities, dependent: :destroy
  validates :icon, :description, presence: true
  validates :description, length: { minimum: 100 }
  validates :name, inclusion: {in: NAMES}, allow_blank: true
end
