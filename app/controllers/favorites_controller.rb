class FavoritesController < ApplicationController

  def create
    @favorite = Favorite.new

    @spot = Spot.find(params[:spot_id])
    @favorite.spot = @spot
    @favorite.user = current_user
    @favorite.save
    redirect_to spot_path(@spot)

    @favorite.user.add_points_and_update_status(10)
  end

  def destroy
    @favorite = Favorite.find(params[:id])

    @favorite.destroy
    redirect_to spot_path(@favorite.spot)
  end
end
