class ArtistsController < ApplicationController
  helper_method :artist
  respond_to :js

  def index
    respond_to do |format|
      format.html
      format.js
    end
  end

  protected

  def artist
    ArtistPresenter.new(Artist.find(params[:id]))
  end
end
