class FavoritesController < ApplicationController
  def index
    @favorite = Favorite.all
  end

  def create
    @favorite = Favorite.new
    @favorite.user = current_user

    @spot = Spot.find(params[:spot_id])
    @favorite.spot = @spot
    authorize @favorite
    if @favorite.save
      respond_to do |format|
        format.html { redirect_to spot_path(@spot) }
        format.text { render partial: "favorites/destroy", locals: { favorite: @favorite }, formats: [:html] }
      end
    else
      respond_to do |format|
        format.html { render :new }
      end
    end

    # @favorite.user.add_points_and_update_status(2)
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    authorize @favorite
    respond_to do |format|
      format.html { redirect_to spot_path(@favorite.spot) }
      format.text { render partial: "favorites/create", locals: { spot: @favorite.spot }, formats: [:html] }
    end
  end
end
