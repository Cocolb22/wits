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

    check_profile_point(@user)

      redirect_to profile_path
      flash[:notice] = "Profil modifié !"
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:last_name, :first_name, :nick_name, :address, :photo, :birthday, :gender, :favorite_area)
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
