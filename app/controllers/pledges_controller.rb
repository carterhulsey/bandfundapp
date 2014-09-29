class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new
    @reward = Reward.find_by(:id => params[:reward_id])
  end

  def show
  end

end