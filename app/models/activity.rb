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

  belongs_to :user
  validates :icon, :description, presence: true
  validates :description, length: { minimum: 100 }
  validates :name, inclusion: {in: NAMES}, allow_blank: true
end
