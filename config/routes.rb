Rails.application.routes.draw do
  get 'home/index'
  devise_for :accounts
  resources :communities
  resources :posts

  root to: "home#index"
end
