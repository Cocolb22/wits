class VotesController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @vote = Vote.new(upvoted: params[:upvoted])
    @vote.spot = @spot
    @vote.user = current_user
    authorize @vote
    if @vote.save
      respond_to do |format|
        format.html { redirect_to vote_path(@vote) }
        format.text { render partial: "spots/vote_header", locals: { spot: @spot }, formats: [:html] }
      end
      if (@spot.votes.count % 10).zero?
        @spot.user.add_points_and_update_status(10)
      end
    end
  end

  def update
    @vote = Vote.find(params[:id])
    @vote.update(upvoted: params[:upvoted])
    authorize @vote
    if @vote.save
      respond_to do |format|
        format.html { redirect_to vote_path(@vote) }
        format.text { render partial: "spots/vote_header", locals: { spot: @vote.spot }, formats: [:html] }
      end
    end
  end
end
