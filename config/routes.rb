Rails.application.routes.draw do
  get 'home/index'
  devise_for :accounts
  get "u/:username" => "profile#index", as: :profile
  
  resources :communities do
    resources :posts
  end

  root to: "home#index"
end
