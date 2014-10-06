class Fans::Devise::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = Fan.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?
      sign_in_and_redirect :fan, @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def after_sign_up_path_for(resource)
    root_url
  end
end
