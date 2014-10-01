class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new
    @reward = Reward.find_by(:id => params[:reward_id])
    @artist = Artist.find_by(:id => @reward.id)
  end

  def show
  end

  def create
    token = params[:stripeToken]
    @reward = Reward.find_by(:id => params[:reward_id])
    @artist = Artist.find_by(:id => @reward.artist_id)

    @customer = Stripe::Customer.create({
        :email => current_fan.email,
        :card => params[:stripeToken],
        :plan => params[:reward_id]
        }, @artist.access_token
      )

    charge = Stripe::Charge.create({
      :customer    => @customer.id,
      :amount      => @reward.price,
      :description => @reward.title,
      :currency    => "usd",
      :application_fee => 1122 #Amount charged to artist in cents
      }, @artist.access_token # user's access token from the Stripe Connect flow
    )



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