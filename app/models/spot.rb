class Spot < ApplicationRecord
  TYPES = ["Plage", "Spot sauvage", "École", "Port"]
  CATEGORIES = ["Plage Familiale", "Sable Fin", "Pour Les Débutants", "Galets", "Pour Les Experts", "Perle Rare" ]

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :spot_activities, dependent: :destroy
  has_many :activities, through: :spot_activities
  has_many :weathers, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_one :service, dependent: :destroy

  accepts_nested_attributes_for :spot_activities

  has_many_attached :photos

  validates :full_name, :address, :description, :spot_type, presence: true
  validates :description, length: {minimum: 50}
  validates :spot_type, inclusion: {in: TYPES}
  validates :category, inclusion: {in: CATEGORIES}, allow_blank: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:address],
    using: {
      tsearch: { prefix: true }
  }

  def avg_rating
    return 0 if comments.empty?

    comments.average(:rating)&.round(1)
  end

  def icon
    case spot_type
    when "Plage"
      "type-beach.svg"
    when "Spot sauvage"
      "type-nature.svg"
    when "Port"
      "type-port.svg"
    when "École"
      "type-sailing.svg"
    end
  end

  def build_address
    self.address = "#{street}, #{zipcode} #{city}"
  end

  def upvote_spot
    self.upvote += 1
  end

  def downvote_spot
    self.downvote += 1
  end
end
