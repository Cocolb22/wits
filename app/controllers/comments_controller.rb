class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @spot = Spot.find(params[:spot_id])
    @comments = @spot.comments
    @comment.spot = @spot
    @comment.user = current_user

    unless current_user.comments.where(created_at: (Date.today.midnight..Date.tomorrow.midnight)).count >= 2
      @comment.user.add_points_and_update_status(2)
    end

    unless current_user.comments.images.where(created_at: (Date.today.midnight..Date.tomorrow.midnight)).count >= 2
      @comment.user.add_points_and_update_status(5)
    end



    if @comment.save
      respond_to do |format|
        format.html { redirect_to comments_spot_path(@spot) }
        format.json do
          render json: { success: true,
            partial: render_to_string(partial: 'spots/comment', locals: { comment: @comment }, formats: [:html]),
            form: render_to_string(partial: 'comments/form', locals: { spot: @spot, comment: Comment.new }, formats: [:html]),
            rating: render_to_string(partial: 'comments/rating', locals: {spot: @spot}, formats: [:html])
          }.to_json
        end
      end
    else
      respond_to do |format|
        format.html { render 'spots/comments' }
        format.json do
          render json: { success: false,
            form: render_to_string(partial: 'comments/form', locals: { spot: @spot, comment: @comment }, formats: [:html])
          }.to_json
        end
      end
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:content, :rating, images: [])
  end
end
