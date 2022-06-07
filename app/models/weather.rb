class Weather < ApplicationRecord
  belongs_to :spot
  has_many :tides, dependent: :destroy
end
