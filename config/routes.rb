Rails.application.routes.draw do
  get 'home/index'
  devise_for :accounts
  get "u/:username" => "home#profile", as: :profile
  
  resources :communities do
    resources :posts
  end

  resources :subscriptions

  root to: "home#index"
end
