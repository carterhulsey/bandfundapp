class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :featured_artist

  def auth_failure
    render '/shared/error.html.haml'
  end

  def featured_artist
    Artist.find_by(featured: true)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :about_me, :paypal_link, :genre_id, :city, :state, :website_url) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :current_password, :password, :password_confirmation, :name, :about_me, :paypal_link, :genre_id, :city, :state, :website_url, :video_url, :image, :itunes_url) }
  end


  def after_update_path_for(resource)
    gtresource.class
  end
end
