class SpotsController < ApplicationController
  def index
    if params[:activities]
      @spots = Spot.joins(:activities).where("activities.id IN (?)", params[:activities].reject(&:blank?).map(&:to_i))
    else
      @spots = Spot.all
    end

    if params[:query].present?
      @spots = @spots.global_search(params[:query])
    end
  end
end
