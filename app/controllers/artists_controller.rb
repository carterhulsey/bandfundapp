class ArtistsController < ApplicationController
  helper_method :artist

  protected

  def artist
    ArtistPresenter.new(Artist.find(params[:id]))
  end
end
