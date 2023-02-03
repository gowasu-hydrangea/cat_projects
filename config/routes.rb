Rails.application.routes.draw do
  
  
  root to: "customers/homes#top"
  get '/about' => 'customers/homes#about'
  
  
  # devise_for :customers
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations',
  }
  
  
  devise_scope :customer do
    post 'customers/guest_sign_in', to: 'customers/sessions#new_guest'
  end
  
  
  namespace :customer do
    
    get 'searches/search'
    
    get 'relationships/followings'
    get 'relationships/followers'
    
      resources :cat_coffee_shops, only: [:new,:create,:index,:show,:edit,:update,:destroy] do
        resource :cat_coffee_shop_favorites, only: [:create, :destroy] 
        resources :cat_coffee_shop_comments, only: [:create, :destroy]
      end
      
      
      resources :lost_cats, only: [:new,:create,:index,:show,:edit,:update,:destroy] do
        resource :lost_cat_favorites, only: [:create, :destroy]
        resources :lost_cat_comments, only: [:create, :destroy]
      end
      
      
      resources :customers, only: [:index, :show, :edit, :update] do
        member do
          get :cat_coffee_shop_favorites
        end
        
        resource :relationships, only: [:create, :destroy]
        get 'followings' => 'relationships#followings', as: 'followings'
        get 'followers' => 'relationships#followers', as: 'followers'
      end
      
  end
  
  
  
  # devise_for :admins
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  namespace :admin do
      get '/top' => 'homes#top'
      
      resources :cat_coffee_shops, only: [:index, :show, :edit, :update]
    
      resources :lost_cats, only: [:index, :show, :edit, :update]
      
      resources :customers, only: [:index, :show, :edit, :update, :unsubscribe, :withdraw]
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
