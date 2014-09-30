Rails.application.routes.draw do
  devise_for :fans, controllers: { registrations: "fans/devise/registrations"}
  get "/artists/auth/:provider/callback" => "sessions#create"
  devise_for :artists, controllers: { registrations: "artists/devise/registrations"}
  
  resources :rewards, only: :show do 
    resources :pledges, only: [:new, :create, :update]
  end

  resources :artists, only: :show do
    resources :rewards, only: [:new, :create, :update]
    resources :pledges, only: [:show, :new, :create]
  end
  root "welcome#index"
end
