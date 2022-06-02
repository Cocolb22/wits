class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  GENDERS =["Homme", "Femme", "Non Binaire"]
  OPT_FIELDS = ["last_name", "first_name", "address", "birthday", "gender", "favorite_area"]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :spots
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites
  has_many :favorite_spots, through: :favorites, source: :spot

  has_one_attached :photo

  validates :nick_name, presence: true, uniqueness: true
  validates :gender, inclusion: {in: GENDERS}, allow_blank: true

  def add_points_and_update_status(points)
    self.profile_exp += points
    if (20..49).to_a.include?(profile_exp)
      self.status = "Mousse"
    elsif (50..99).to_a.include?(profile_exp)
      self.status = "Matelot"
    elsif (100..249).to_a.include?(profile_exp)
      self.status = "Capitaine"
    elsif (250..499).to_a.include?(profile_exp)
      self.status = "Amiral"
    elsif profile_exp > 500
      self.status = "Vieux Briscard"
    end
    self.save
  end
end
