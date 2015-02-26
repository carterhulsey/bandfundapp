class ArtistsController < ApplicationController

  helper_method :artist
  respond_to :js

  def index
    @reward = Reward.new
    if !current_artist
      redirect_to root_url
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  def show
    pledges = Pledge.where(artist_id: params[:id])
    @total = 0

    if current_fan && current_fan.has_pledge_for?(artist)
      @existing_pledge = current_fan.pledge_for(artist)
    end

    pledges.each do |pledge|
      @total += pledge.price
    end
  end

  def image
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(image: params[:artist][:image])
      render json: {image: @artist.image.url}
    else
      render json: {errors: @artist.errors.full_messages}, status: 422
    end
  end

  protected

  def artist
    ArtistPresenter.new(Artist.find(params[:id]))
  end
end
