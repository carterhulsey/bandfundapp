class RewardsController < ApplicationController
  def index
    @rewards = Reward.where(:artist_id => params[:artist_id])
    @artist = Artist.find_by(:id => params[:artist_id])
  end

  def new
    @reward = current_artist.rewards.build
  end

  def create
    reward = current_artist.rewards.build(reward_params)
    if reward.save
      redirect_to [:edit, current_artist, :registration]
    end
  end

  protected

  def reward_params
    params.require(:reward).permit(:title, :description, :price, :address_required)
  end
end
