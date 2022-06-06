class FavoriteActivitiesController < ApplicationController
  def create
    @favorite_activity = FavoriteActivity.new

    @activity = Activity.find(params[:activity_id])
    @favorite_activity.activity = @activity
    @favorite_activity.user = current_user

    @favorite_activity.save
    respond_to do |format|
      format.html { redirect_to profile_path }
      format.text { render partial: "favorite_activities/destroy", locals: { activity: @activity, favorite_activity: @favorite_activity }, formats: [:html] }
    end
  end

  def destroy
    @favorite_activity = FavoriteActivity.find(params[:id])

    @favorite_activity.destroy

    respond_to do |format|
      format.html { redirect_to profile_path }
      format.text { render partial: "favorite_activities/create", locals: { activity: @favorite_activity.activity }, formats: [:html] }
    end
  end
end
