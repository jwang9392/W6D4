class CommentsController < ApplicationController
  def index
    if params.has_key?(:user_id)
      user = User.find(params[:user_id])
      render json: user.comments
    else
      artwork = Artwork.find(params[:artwork_id])
      render json: artwork.comments
    end
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.find(params[:id]).destroy
    render json: comment
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :artwork_id)
  end
end