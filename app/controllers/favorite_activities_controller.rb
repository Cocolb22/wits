class FavoriteActivitiesController < ApplicationController
  def create

    if params[:favorites_activities]
      @favorites_activities = FavoriteActivity.joins(:favorites_activities).where("activities.id IN (?)", params[:favorites_activities].reject(&:blank?).map(&:to_i))
    end

    @favorite_activity = Favorite_activity.new

    @activity = Activity.find(params[:activity_id])
    @favorite_activity.activity = @activity
    @favorite_activity.user = current_user

    @favorite_activity.save
    redirect_to profile_path
  end

  def destroy
    @favorite_activity = FavoriteActivity.find(params[:id])

    @favorite_activity.destroy
    redirect_to profile_path
  end
end
