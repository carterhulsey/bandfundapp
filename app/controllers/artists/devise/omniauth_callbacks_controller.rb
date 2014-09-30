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
    # Delete the code inside of this method and write your own.
    # The code below is to show you where to access the data.
    raise request.env["omniauth.auth"].to_yaml
  end
end
