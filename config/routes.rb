Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :products
    end
  end

  devise_for :users
  resources :products
  resources :order_items
  resource :carts, only: [:show]

  get '/cart', to: 'carts#show'
  root to: 'home#index'
end
