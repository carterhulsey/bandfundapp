Rails.application.routes.draw do
  devise_for :fans
  get "/artists/auth/:provider/callback" => "sessions#create"
  devise_for :artists, controllers: { registrations: "artists/devise/registrations"}
  resources :artists, only: :show do
    resources :rewards, only: [:new, :create, :update]
  end
  root "welcome#index"
end
