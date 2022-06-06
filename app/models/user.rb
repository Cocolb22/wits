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
  has_many :favorite_activities
  has_many :favorite_activity_activities, through: :favorite_activities, source: :activity

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

  def next_status
    case profile_exp
    when 0..19
      {
        next_status: "Mousse",
        next_status_level: 20,
        remaining_points: 20 - profile_exp,
        completion_percent: profile_exp * 100 / 20
      }
    when 20..49
      {
        next_status: "Matelot",
        next_status_level: 50,
        remaining_points: 50 - profile_exp,
        completion_percent: profile_exp * 100 / 50
      }

    when 50..99
      {
        next_status: "Capitaine",
        next_status_level: 100,
        remaining_points: 100 - profile_exp,
        completion_percent: profile_exp * 100 / 100
      }
    when 100..249
      {
        next_status: "Amiral",
        next_status_level: 250,
        remaining_points: 250 - profile_exp,
        completion_percent: profile_exp * 100 / 250
      }
    when 250..499
      {
        next_status: "Vieux Briscard",
        next_status_level: 500,
        remaining_points: 500 - profile_exp,
        completion_percent: profile_exp * 100 / 500
      }
    else
      {
      next_status: "Vieux Briscard"
      }
    end
  end
end
