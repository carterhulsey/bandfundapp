class PledgesController < ApplicationController
  def new
    @pledge = Pledge.new
    @reward = Reward.find_by(:id => params[:reward_id])
    @artist = Artist.find_by(:id => @reward.id)
  end

  def show
  end

  def create
    stripe = params
    token = params[:stripeToken]
    @reward = Reward.find_by(:id => params[:reward_id])
    @artist = Artist.find_by(:id => @reward.artist_id)
    
    # Checks to see if fan has already set up a subscription
    if current_fan.stripe_id == nil
    # Saves customer object into our stripe account, so we can save credit card information
      customer = Stripe::Customer.create(
        {:card => token,
        :description => current_fan.email
        }, ENV['STRIPE_SECRET']
      )
      current_fan.update_attributes(:stripe_id => customer.id)
    end
    
    # Creates new token to add a customer to a plan
    customer_token = Stripe::Token.create(
      {:customer => current_fan.stripe_id},
      @artist.access_token # user's access token from the Stripe Connect flow
    )
    
    # Creates a customer under a connected artists plan, and starts billing cycle
    customer = Stripe::Customer.create({
        :email => current_fan.email,
        :card => customer_token.id,
        :plan => params[:reward_id],
        :application_fee_percent => 20 #Percent we take for letting connected accounts use the service
        }, @artist.access_token
      )

   @pledge = Pledge.create(artist_id: @artist.id, fan_id: current_fan.id, plan: @reward.title, price: @reward.price)
    if @pledge.save
      ArtistPledge.create(pledge_id: @pledge.id, artist_id: @pledge.artist_id, price: @reward.price)
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