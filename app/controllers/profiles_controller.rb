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

  private

  def profile_params
    params.require(:user).permit(:last_name, :first_name, :nick_name, :address, :photo, :birthday, :gender, :favorite_area)
  end
end
