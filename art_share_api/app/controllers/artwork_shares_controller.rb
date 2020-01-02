class ArtworkSharesController < ApplicationController

  def index
    if params.key?(:user_id) 
      viewer = User.find(params[:user_id])
      render json: viewer.artwork_shares
    else
      artwork = Artwork.find(params[:artwork_id])
      render json: artwork.artwork_shares
    end
  end

  def create
    artwork_share = ArtworkShare.new(artwork_share_params)

    if artwork_share.save
      render json: artwork_share
    else 
      render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    artwork_share = ArtworkShare.find(params[:id])
    render json: artwork_share
  end

  def destroy
    artwork_share = ArtworkShare.find(params[:id]).destroy
    render json: artwork_share
  end

  def update
    artwork_share = ArtworkShare.find(params[:id])
    if artwork_share.update(artwork_share_params)
      render json: artwork_share
    else 
      render json: artwork_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def favorite
    artwork_share = ArtworkShare.find(params[:id])
    artwork_share.favorite ? 
      artwork_share.update(favorite: false) : 
      artwork_share.update(favorite: true)
    render json: artwork_share
  end

  private

  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end