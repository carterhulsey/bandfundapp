class ArtistsController < ApplicationController
  helper_method :artist
  has_and_belongs_to_many :pledges

  protected

  def artist
    ArtistPresenter.new(Artist.find(params[:id]))
  end
end
