Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/manager', as: 'rails_admin'
  namespace :admin do
    root to: "panels#index"
    resources :users
    resources :restaurants
    resources :products

  end
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  resources :products do
    post '/favourite' => "products#favourite"
    resources :order_items, only: [:create, :destroy]
    # member do
    post 'ratings'
    # end
  end
  resources :food_orders, only: [:show, :index] do
    post 'finalize'
  end

  root 'products#index'

  resources :foods do
    collection do
      get 'fetch'
    end
  end

end
