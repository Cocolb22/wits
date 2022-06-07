class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index search]
  before_action :verifiy_user_exp, only: %i[new create]

  def new
    verifiy_user_exp
    @spot = Spot.new
    @spot.spot_activities.build
  end

  def create
    verifiy_user_exp
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    @spot.weathers

    if @spot.save
      redirect_to spot_path(@spot)
    else
      render :new
    end
  end

  def search; end

  def index
    if params[:activities]
      @spots = Spot.joins(:activities).where("activities.id IN (?)", params[:activities].reject(&:blank?).map(&:to_i)).distinct
    else
      @spots = Spot.order(id: :desc)
    end

    @spots = @spots.where(spot_type: params[:spot_type]).distinct if params[:spot_type].present?
    @spots = @spots.near(params[:location], 3) if params[:location].present?

    @spots = @spots.sort_by { |spot| -spot.avg_rating } if params[:order] == "desc_moyen_rating"

    @markers = @spots.reject { |spot| spot.latitude.nil? || spot.longitude.nil? }.map do |spot|
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
    @services = @spot.service
    @activities = @spot.activities
  end

  def comments
    @spot = Spot.find(params[:id])
    @comments = @spot.comments.order('id DESC')
    @user_favorite = Favorite.find_by(user: current_user, spot: @spot)
    @comment = Comment.new
    if params[:order] == "recent"
      @comments = @spot.comments.order('id DESC')
      @comment = Comment.new
    elsif params[:order] == "rating"
      @comments = @spot.comments.sort_by(&:rating).reverse
      @comment = Comment.new
    elsif params[:order] == "stars"
      @comments = @spot.comments.where("rating = 5")
      @comment = Comment.new
    elsif params[:order] == "popular"
      @comments = @spot.comments.where(&:like)
      @comment = Comment.new
    end
  end

  def forecast
    @spot = Spot.find(params[:id])
    @user_favorite = Favorite.find_by(user: current_user, spot: @spot)
    @weathers = @spot.weathers
  end

  def upvote
    @spot = Spot.find(params[:id])
    @spot.upvote_spot
    @spot.save
    redirect_to spot_path(@spot)
  end

  def downvote
    @spot = Spot.find(params[:id])
    @spot.downvote_spot
    @spot.save
    redirect_to spot_path(@spot)
  end

  private

  def spot_params
    params.require(:spot).permit(:full_name, :description, :category, :spot_type, :address, icon: [], activity_ids: [])
  end

  def verifiy_user_exp
    if current_user.profile_exp < 500
      redirect_to profile_path
      flash[:alert] = "Vous n'avez pas assez de points pour créer un spot."
    end
  end
end
