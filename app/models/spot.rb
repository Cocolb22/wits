class Spot < ApplicationRecord
  TYPES = ["plage", "reef", "falaise", "école", "base nautique", "port"]
  CATEGORIES = ["Plage Familiale", "Sable Fin", "Pour Les Débutants", "Galets", "Pour Les Experts", "Perle Rare" ]

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :spot_activities, dependent: :destroy
  has_many :activities, through: :spot_activities
  has_many :weathers, dependent: :destroy
  has_one :service, dependent: :destroy

  validates :full_name, :address, :description, :type, :icon, presence: true
  validates :description, length: {minimum: 100}
  validates :type, inclusion: {in: TYPES}
  validates :category, inclusion: {in: CATEGORIES}, allow_blank: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :full_name, :address, :description, :type, :category ],
    associated_against: {
      activities: [ :name, :description ]
    },
    using: {
      tsearch: { prefix: true }
  }
end
