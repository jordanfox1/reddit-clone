Rails.application.routes.draw do
  get 'home/index'
  devise_for :accounts
  
  resources :communities do
    resources :posts
  end

  root to: "home#index"
end
