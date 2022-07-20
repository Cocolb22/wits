class SpotsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index search]

  rescue_from Pundit::NotAuthorizedError, with: :verifiy_user_exp

  def new
    @spot = Spot.new
    authorize @spot
    @spot.spot_activities.build
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    authorize @spot

    if @spot.save
      WeatherService.new(@spot).call
      redirect_to spot_path(@spot)

    else
      render :new
    end
  end

  def search
    authorize Spot
  end

  def index
    session[:query_search] = request.query_string
    if params[:activities]
      @spots = policy_scope(Spot).joins(:activities)
                   .order(id: :desc)
                   .includes(:comments, :spot_activities, :activities, photos_attachments: [:blob])
                   .where("activities.id IN (?)", params[:activities]
                   .reject(&:blank?).map(&:to_i)).distinct
    else
      @spots = policy_scope(Spot).order(id: :desc)
                   .includes(:comments, :spot_activities, :activities, photos_attachments: [:blob])
    end

    @spots = @spots.where(spot_type: params[:spot_type]).distinct if params[:spot_type].present?
    @spots = @spots.near(params[:location], 5) if params[:location].present?

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
    @spot = Spot.includes(photos_attachments: [:blob]).find(params[:id])
    @comments = @spot.comments.includes(images_attachments: [:blob])
    @user_favorite = Favorite.find_by(user: current_user, spot: @spot)
    @services = @spot.service
    @activities = @spot.activities
    authorize @spot
  end

  def comments
    @spot = Spot.includes(photos_attachments: [:blob]).find(params[:id])

    @comments = @spot.comments.order('id DESC').includes(user: [photo_attachment: [:blob]], images_attachments: [:blob])
    @user_favorite = Favorite.find_by(user: current_user, spot: @spot)
    @comment = Comment.new
    if params[:order] == "recent"
      @comments = @comments.order('id DESC')
    elsif params[:order] == "rating"
      @comments = @comments.order("rating DESC")
    elsif params[:order] == "stars"
      @comments = @comments.where("rating = 5")
    elsif params[:order] == "popular"
      @comments = @comments.sort_by { |comment| -comment.likes.count }
    end
    authorize @spot
  end

  def forecast
    @spot = Spot.includes(photos_attachments: [:blob]).find(params[:id])
    @user_favorite = Favorite.find_by(user: current_user, spot: @spot)
    @weathers = @spot.weathers
    authorize @spot
  end

  def upvote
    @spot = Spot.find(params[:id])
    @spot.upvote_spot
    @spot.save
    redirect_to spot_path(@spot)
    authorize @spot
  end

  def downvote
    @spot = Spot.find(params[:id])
    @spot.downvote_spot
    @spot.save
    redirect_to spot_path(@spot)
    authorize @spot
  end

  private

  def spot_params
    params.require(:spot).permit(:full_name, :description, :category, :latitude, :longitude, :spot_type, :address, :photos, icon: [], activity_ids: [])
  end

  def verifiy_user_exp
    redirect_to profile_path
    flash[:alert] = "Vous n'avez pas assez de points pour créer un spot."
  end
end
