class SpotsController < ApplicationController

  def show
    @spot = Spot.find(params[:id])
  end

  def comments
    @spot = Spot.find(params[:id])
    @comments = @spot.comments
    @comment = Comment.new
  end
end
