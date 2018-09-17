Rails.application.routes.draw do

  namespace 'api' do
    namespace 'v1' do
      resources :products
    end
  end

  devise_for :users
  root to: 'home#index'
  get '/cart', to: 'carts#show'
  resources :products
  resources :order_items
  resource :carts, only: [:show]

end
