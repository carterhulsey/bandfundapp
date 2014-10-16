class RewardsController < ApplicationController
  before_action :auth_users!


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
    Stripe::Plan.create({
      :amount => (reward.price * 100).to_i,
      :interval => 'month',
      :name => reward.title,
      :currency => 'usd',
      :id => reward.id
    }, current_artist.access_token)
      redirect_to artists_path
    end
  end

  def edit
    @reward = Reward.find_by(id: params[:id])
  end

  def update
    @reward = Reward.find_by(id: params[:id])
    if @reward.update(reward_params)
      redirect_to artists_path
    end
  end

  def destroy
    @reward = Reward.find_by(id: params[:id])
    @reward.destroy
    redirect_to artists_path
  end

  protected

  def reward_params
    params.require(:reward).permit(:id, :title, :description, :price, :address_required)
  end
end
