Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users
  root to: 'pages#home'
  get '/page/component', to: 'pages#component'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/service-worker.js' => "service_worker#service_worker"
  get '/manifest.json' => "service_worker#manifest"

  resource :profile, only: [:show, :edit, :update] do
    get :spots
    get :comments
  end

  resources :spots, only: [:index, :show, :new, :create] do
    member do
      get :activities
      get :comments
      get :forecast
    end
    collection do
      get :search
    end
    resources :comments, only: [:create]
    resources :favorites, only: [:create]
    resources :votes, only: [:create]
  end


  resources :activities, only: [] do
    resources :favorite_activities, only: [:create]
  end

  resources :favorites, only: [:destroy]
  resources :likes, only: [:destroy]
  resources :favorite_activities, only: [:destroy]
  resources :votes, only: [:update]

  resources :comments, only: [] do
    member do
      post :review
    end
    resources :likes, only: [:create]
  end
end
