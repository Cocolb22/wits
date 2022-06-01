class Spot < ApplicationRecord
  TYPES = ["Plage", "Spot sauvage", "École", "Port"]
  CATEGORIES = ["Plage Familiale", "Sable Fin", "Pour Les Débutants", "Galets", "Pour Les Experts", "Perle Rare" ]

  before_validation :build_address

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :spot_activities, dependent: :destroy
  has_many :activities, through: :spot_activities
  has_many :weathers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one :service, dependent: :destroy

  has_many_attached :photos

  validates :full_name, :address, :street, :zipcode, :city, :description, :spot_type, presence: true
  validates :description, length: {minimum: 100}
  validates :spot_type, inclusion: {in: TYPES}
  validates :category, inclusion: {in: CATEGORIES}, allow_blank: true

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :full_name, :address, :description, :spot_type, :category ],
    associated_against: {
      activities: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
  }

  def build_address
    self.address = "#{street}, #{zipcode} #{city}"
  end
end


