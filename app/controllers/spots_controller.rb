class SpotsController < ApplicationController
  def index
    if params[:activities]
      @spots = Spot.joins(:activities).where("activities.id IN (?)", params[:activities].reject(&:blank?).map(&:to_i))
    else
      @spots = Spot.all
    end

    @spots = @spots.near(params[:location], 10) if params[:location].present?

    # @markers = @spots.geocoded.map do |spot|
    #   {
    #     lat: spot.latitude,
    #     lng: spot.longitude,
    #     info_window: render_to_string(partial: "info_window", locals: { spot: spot }),
    #     image_url: helpers.asset_url("beach.png"),
    #     spot_id: spot.id
    #   }
    # end

    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude
      }
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def comments
    @spot = Spot.find(params[:id])
    @comments = @spot.comments
    @comment = Comment.new
  end
end
