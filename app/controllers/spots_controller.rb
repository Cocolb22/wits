class SpotsController < ApplicationController
  def index
    if params[:activities]
      @spots = Spot.joins(:activities).where("activities.id IN (?)", params[:activities].reject(&:blank?).map(&:to_i))
    else
      @spots = Spot.all
    end

    @spots = @spots.near(params[:location], 3) if params[:location].present?

    @markers = @spots.geocoded.map do |spot|
      {
        lat: spot.latitude,
        lng: spot.longitude,
        image_url: helpers.asset_url("icons/#{spot.icon}"),
        id: spot.id
      }
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @user_favorite = Favorite.find_by(user: current_user, spot: @spot)
    @spot_service = Service.select(spot: @spot, boolean: true)
  end

  def comments
    @spot = Spot.find(params[:id])
    @comments = @spot.comments
    @comment = Comment.new
  end
end
