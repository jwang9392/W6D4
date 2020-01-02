class LikesController < ApplicationController

  def index
    likeable = ['user_id', 'artwork_id', 'comment_id' ].find {|el| params.has_key?(el.to_sym) }
    class_name = likeable.split("_").first.capitalize.constantize

    render json: class_name.find(params[likeable.to_sym]).likes
  end

  def create
    like = Like.new(like_params)
    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    render json: like
  end

  private

  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id, :user_id)
  end 
end