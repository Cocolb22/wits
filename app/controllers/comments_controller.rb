class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @spot = Spot.find(params[:spot_id])
    @comment.spot = @spot
    @comment.user = current_user

    if @comment.save
      redirect_to comments_spot_path(@spot)
    else
      render 'spots/comments'
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:content, :rating)
  end
end
