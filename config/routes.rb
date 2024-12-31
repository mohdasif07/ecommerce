Rails.application.routes.draw do
root "home#index"
devise_for :users
resources :products
resources :orders do
   collection do
      post :checkout 
    end
end
  
  resource :carts, only: [:show] do
    post 'add_to_cart', to: 'carts#add_to_cart'
    
    delete 'remove_from_cart/:id', to: 'carts#remove_from_cart', as: 'remove_from_cart'
  member do 
    get :checkout
  end
  end
end