Rails.application.routes.draw do

  resources :conversations do 
    resources :user_conversations, shallow: true, only: [:create, :destroy]
    resources :messages, shallow: :true, only: [:create]
  end
  resources :restaurants do
    resources :user_restaurants, shallow: true, only: [:create, :destroy]
  end
  # devise_for :users
  # custom controller for users
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
        
      }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    root to: "restaurants#index"
  end

  get "/requests", to: "requests#index"
  delete "/users/image_destroy/:image_id", to: "users#image_destroy", as: "destroy_user_image"

  resources :users, only: [:show, :index] do 
    resources :requests, shallow: true, only: [:create, :destroy] do
      patch :approve, on: :member
      patch :reject, on: :member
    end
  end

  namespace :api, defaults: { format: :json } do 
    # /api...
    namespace :v1 do 
      # /api/v1...
      resources :conversations
      resource :session, only: [:create, :destroy]
      resources :users, only: [:create, :update] do
        #api/v1/users/current
        get :current, on: :collection 
        #default
        #api/v1/users/:id/current
      end
    end
  end


  mount ActionCable.server, at: '/cable'
end
