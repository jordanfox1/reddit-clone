Rails.application.routes.draw do
  get 'home/index'
  devise_for :accounts
  get "u/:username" => "home#profile", as: :profile
  
  resources :communities do
    resources :posts
  end

  resources :subscriptions
  resources :comments, only: [:create]

  root to: "home#index"
end
