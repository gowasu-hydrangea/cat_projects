Rails.application.routes.draw do
  

  namespace :customer do
    get 'relationships/followings'
    get 'relationships/followers'
  end
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
    
      # get 'cat_coffee_shops/new'
      # get 'cat_coffee_shops/create'
      # get 'cat_coffee_shops/index'
      # get 'cat_coffee_shops/show'
      # get 'cat_coffee_shops/edit'
      # get 'cat_coffee_shops/update'
      # get 'cat_coffee_shops/destroy'
      resources :cat_coffee_shops, only: [:new,:create,:index,:show,:edit,:update,:destroy] do
        resource :cat_coffee_shop_favorites, only: [:create, :destroy] 
        resources :cat_coffee_shop_comments, only: [:create, :destroy]
      end
      
      # get 'lost_cats/new'
      # get 'lost_cats/create'
      # get 'lost_cats/index'
      # get 'lost_cats/show'
      # get 'lost_cats/edit'
      # get 'lost_cats/update'
      # get 'lost_cats/destroy'
      resources :lost_cats, only: [:new,:create,:index,:show,:edit,:update,:destroy] do
        resource :lost_cat_favorites, only: [:create, :destroy]
        resources :lost_cat_comments, only: [:create, :destroy]
      end
      
      # get 'customers/index'
      # get 'customers/show'
      # get 'customers/edit'
      # get 'customers/update'
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
      # get 'cat_coffee_shops/index'
      # get 'cat_coffee_shops/show'
      # get 'cat_coffee_shops/edit'
      # get 'cat_coffee_shops/update'
      resources :cat_coffee_shops, only: [:index, :show, :edit, :update]
    
      # get 'lost_cats/index'
      # get 'lost_cats/show'
      # get 'lost_cats/edit'
      # get 'lost_cats/update'
      resources :lost_cats, only: [:index, :show, :edit, :update]
      
      # get 'customers/index'
      # get 'customers/show'
      # get 'customers/edit'
      # get 'customers/update'
      # get 'customers/unsubscribe'
      # get 'customers/withdraw'
      resources :customers, only: [:index, :show, :edit, :update, :unsubscribe, :withdraw]
    
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
