class ProfilesController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to profile_path
      flash[:notice] = "Profil modifié !"
    else
      render :edit
    end
  end

  def spots
    @user = current_user

    if params[:activities]
      @spots = @user.favorite_spots.joins(:activities).where("activities.id IN (?)", params[:activities].reject(&:blank?).map(&:to_i)).distinct
    else
      @spots = @user.favorite_spots.order(id: :desc)
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

  def comments
    @user = current_user
    @comments = @user.comments
  end

  private

  def profile_params
    params.require(:user).permit(:last_name, :first_name, :nick_name, :address, :photo, :birthday, :gender, :favorite_area, :favorite_activity)
  end

  def check_profile_point(user)

    User::OPT_FIELDS.each do |field|
      if user.send(field).present? && !@user.send("#{field}_completed")
        user.add_points_and_update_status(2)
        user.send("#{field}_completed=", true)
        user.save
      end
    end

    if user.photo.attached? && !@user.photo_completed
      user.add_points_and_update_status(2)
      user.photo_completed = true
      user.save
    end
  end

end
