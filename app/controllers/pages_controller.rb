class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def component
    @spot = Spot.find_by(id: 15)
  end
end
