class PledgesController < ApplicationController
  before_action :authenticate_fan!

  def new
    @pledge = Pledge.new
    @reward = Reward.find(params[:reward_id])
    @artist = Artist.find(@reward.artist.id)
    @rewards = Reward.where(:artist_id => @artist.id)
    if !current_fan 
      render "sign_up"
    end

    if @reward.address_required == true
      render "address_required"
    end
  end

  def show
  end

  def create
    stripe = params
    @reward = Reward.find_by(:id => params[:reward_id])
    @artist = Artist.find_by(:id => @reward.artist_id)
    
    # Checks to see if fan has already set up a subscription
    if current_fan.stripe_id == nil
    # Saves customer object into our stripe account, so we can save credit card information
      customer = Stripe::Customer.create(
        {:card => params[:stripeToken],
        :description => current_fan.email
        }, ENV['STRIPE_SECRET']
      )
      current_fan.update_attributes(:stripe_id => customer.id)
    end
    customer_token = Stripe::Token.create(
      {:customer => current_fan.stripe_id},
      @artist.access_token # user's access token from the Stripe Connect flow
    )

    customer = Stripe::Customer.create({
        :email => current_fan.email,
        :card => customer_token.id,
        :plan => params[:reward_id],
        :application_fee_percent => 20 #Percent we take for letting connected accounts use the service
        }, @artist.access_token
      )
    
    current_fan.update_attributes(address_1: params[:Address1], address_2: params[:Address2], city: params[:City], state: params[:State], zip_code: params[:ZIP], country: params[:Country])

    if @reward.address_required == true
      @pledge = Pledge.create(artist_id: @artist.id, fan_id: current_fan.id, plan: @reward.title, price: @reward.price, email: params[:Email], address1: params[:Shipping_Address1], address2: params[:Shipping_Address2], city: params[:Shipping_City], state: params[:Shipping_State], zip: params[:Shipping_ZIP], country: params[:Shipping_Country], first_name: params[:First_Name], last_name: params[:Last_Name], reward_id: @reward.id)
    else
      @pledge = Pledge.create(artist_id: @artist.id, fan_id: current_fan.id, plan: @reward.title, price: @reward.price, email: params[:Email],  first_name: params[:First_Name], last_name: params[:Last_Name], reward_id: @reward.id)
    end
    if @pledge.save
      ArtistPledge.create(pledge_id: @pledge.id, artist_id: @pledge.artist_id, price: @reward.price)
      redirect_to artist_path(@pledge.artist_id)
    else
      render "new" 
    end
  end

  private
  def pledge_params
    params.require(:pledge).permit(:artist_id, :fan_id, :plan, :price, :email, :address1, :address2, :city, :state, :zip, :first_name, :last_name, :reward_id)
  end
end
