class LikesController < ApplicationController
  def create
    @like = Like.new
    @comment = Comment.find(params[:comment_id])
    @like.comment = @comment
    @like.user = current_user

    if @like.save
      if @comment.likes.count % 10 == 0
        @comment.user.profile_exp += 2
        @comment.user.save
      end

      respond_to do |format|
        format.html { redirect_to comments_spot_path(@comment.spot) }
        format.text { render partial: "likes/destroy", locals: { like: @like, comment: @comment }, formats: [:html] }
      end
    end
  end

  def destroy
    @like = Like.find(params[:id])

    @like.destroy
    respond_to do |format|
      format.html { redirect_to comments_spot_path(@like.comment.spot) }
      format.text { render partial: "likes/create", locals: { comment: @like.comment }, formats: [:html] }
    end
  end
end





