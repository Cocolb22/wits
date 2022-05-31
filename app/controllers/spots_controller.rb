class SpotsController < ApplicationController
  def index
    # if params[:query].present?
    #   @spots = Spot.global_search(params[:query])
    # else
    #   @spots = Spot.all
    # end

    if params[:activities]
      @spots = Spot.joins(:activities).where("activities.id IN (?)", params[:activities].reject(&:blank?).map(&:to_i))
    else
      @spots = Spot.all
    end

    # p params[:activities].reject(&:blank?).map(&:to_i)

    # Get all spots with activities matching given ids
    # p Spot.activity_search(params[:activities].reject(&:blank?).map(&:to_i))

    # @spots = @spots.where(spot_type: params[:spot_type]) if params[:spot_type].present?
  end
end
