class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  GENDERS =["Homme", "Femme", "Non Binaire"]

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
end
