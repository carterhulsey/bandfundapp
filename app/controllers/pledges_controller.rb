class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new
    @reward = Reward.find_by(:id => params[:reward_id])
  end

  def show
  end

  def create
    @pledge = Pledge.create(pledge_params)
    if @pledge.save
      ArtistPledge.create(pledge_id: @pledge.id, artist_id: @pledge.artist_id)
      redirect_to artist_path(@pledge.artist_id)
    else
      render "new"
    end
  end

  private
  def pledge_params
    params.require(:pledge).permit(:artist_id, :fan_id, :credit_card, :price)
  end
end