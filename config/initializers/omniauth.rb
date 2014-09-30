require File.join(File.dirname(__FILE__), "../../", "lib","facebook_artist")
require File.join(File.dirname(__FILE__), "../../", "lib","facebook_fan")

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook_artist, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET_KEY'], redirect_uri: '/artists/auth/facebook/callback', scope: %w(email public_profile user_location)
  provider :facebook_fan, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET_KEY'], redirect_uri: '/fans/auth/facebook/callback', scope: %w(email public_profile user_location)
  provider :stripe_connect, ENV['STRIPE_CONNECT_CLIENT_ID'], ENV['STRIPE_SECRET']
end
