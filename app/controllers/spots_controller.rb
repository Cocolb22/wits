class SpotsController < ApplicationController
  def index
    if params[:query].present?
      @spots = Spot.global_search(params[:query])
    else
      @spots = Spot.all
    end
  end
end
