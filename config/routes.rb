Rails.application.routes.draw do

  devise_for :fans, controllers: { registrations: "fans/devise/registrations"}
  devise_for :artists, controllers: { registrations: "artists/devise/registrations", sessions: "artists/devise/sessions"}
  
  devise_scope :fan do
    get '/auth/facebook_fan/callback' => "fans/devise/omniauth_callbacks#facebook"
  end
  devise_scope :artist do
    get '/auth/facebook_artist/callback' => "artists/devise/omniauth_callbacks#facebook"
    get '/artists/auth/stripe_connect/callback' => "artists/devise/omniauth_callbacks#stripe_connect"
  end

  resources :about

  resources :rewards, only: :show do 
    resources :pledges, only: [:new, :create, :update]
  end

  resources :artists, only: [:show, :index] do
    resources :rewards, only: [:new, :create, :update, :index]
    resources :pledges, only: [:show, :new, :create]
  end
  root "welcome#index"
end
