class Artists::Devise::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = Artist.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect :artist, @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end 

  def stripe_connect
    @user = Artist.find_by(id: current_artist.id)
    @code = params[:code]
    line = Cocaine::CommandLine.new(`curl -X POST https://connect.stripe.com/oauth/token -d client_secret=#{ENV['STRIPE_SECRET']} -d code=#{@code} -d grant_type=authorization_code`)
    @response = ActiveSupport::JSON.decode(line.run)
    Artist.stripe_params(@response, @user)
    redirect_to root_url
  end

  def after_sign_in_path_for(resource)
    artists_path
  end

  def after_sign_up_path_for(resource)
    artists_path
  end
end
