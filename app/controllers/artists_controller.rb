class ArtistsController < ApplicationController
  helper_method :artist
  respond_to :js

  def index
    if !current_artist
      redirect_to root_url
    else
      respond_to do |format|
        format.html
        format.js
      end
    end
  end

  protected

  def artist
    ArtistPresenter.new(Artist.find(params[:id]))
  end
end
