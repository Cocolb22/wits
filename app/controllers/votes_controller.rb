class VotesController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @vote = Vote.new(upvoted: params[:upvoted])
    @vote.spot = @spot
    @vote.user = current_user
    if @vote.save
      respond_to do |format|
        format.html { redirect_to vote_path(@vote) }
        format.text { render partial: "spots/vote_header", locals: { spot: @spot }, formats: [:html] }
      end
    end
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.update(upvoted: params[:upvoted])
    if @vote.save
      respond_to do |format|
        format.html { redirect_to vote_path(@vote) }
        format.text { render partial: "spots/vote_header", locals: { spot: @vote.spot }, formats: [:html] }
      end
    end
  end
end
