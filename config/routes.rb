Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/page/component', to: 'pages#component'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resource :profile, only: [:show, :edit, :update]

  resources :spots, only: [:index, :show, :new, :create] do
    member do
      get :activities
      get :comments
      get :forecast
      patch :approve
      patch :unapprove
    end
    collection do
      get :search
    end
    resources :comments, only: [:create]
    resources :favorites, only: [:create]
  end

  resources :activities, only: [] do
    resources :favorite_activities, only: [:create]
  end

  resources :favorites, only: [:index, :destroy]
  resources :likes, only: [:destroy]
  resources :favorite_activities, only: [:destroy]

  resources :comments, only: [] do
    member do
      post :review
    end
    resources :likes, only: [:create]
  end
end
