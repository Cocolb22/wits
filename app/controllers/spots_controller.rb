class SpotsController < ApplicationController

  def index

    # if params[:query].present?
    #   @spots = Spot.global_search(params[:query])
    # else
    #   @spots = Spot.all
    # end
    
    if params[:activities]
      @spots = Spot.joins(:activities).where("activities.id IN (?)", params[:activities].reject(&:blank?).map(&:to_i))
    else
      @spots = Spot.all
    end

    if params[:query].present?
      @spots = @spots.global_search(params[:query])
    end
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def comments
    @spot = Spot.find(params[:id])
    @comments = @spot.comments
    @comment = Comment.new
  end
end
