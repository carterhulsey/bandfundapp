Rails.application.routes.draw do
  devise_for :artists, controllers: { :omniauth_callbacks => "artists/devise/omniauth_callbacks", registrations: "artists/devise/registrations"}
  resources :artists, only: :show do
    resources :rewards, only: [:new, :create, :update]
  end
  root "welcome#index"
end
