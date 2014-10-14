class ArtistsController < ApplicationController
  before_action :auth_users!, except: :index

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
    pledges.each do |pledge|
      @total += pledge.price
    end
  end

  protected

  def artist
    ArtistPresenter.new(Artist.find(params[:id]))
  end
end
