class LikesController < ApplicationController
  def create
    @like = Like.new
    @comment = Comment.find(params[:comment_id])
    @like.comment = @comment
    @like.user = current_user

    if @like.save
      redirect_to comments_spot_path(@comment.spot)
    else
      redirect_to comments_spot_path(@comment.spot)
    end
  end

  def destroy
    @like = Like.find(params[:id])

    @like.destroy
    redirect_to comments_spot_path(@like.comment.spot)
  end
end
