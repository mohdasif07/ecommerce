Rails.application.routes.draw do
    post 'carts/:cart_id/add_to_cart/:product_id', to: 'carts#add_to_cart', as: 'add_to_cart_cart'
root "home#index"
devise_for :users
resources :products
resources :orders
resources :carts
end
