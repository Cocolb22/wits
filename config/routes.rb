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
      patch :approve
      patch :unapprove
    end
    resources :comments, only: [:create]
  end

  resources :favorites, only: [:create, :index]

  resources :comments, only: [] do
    member do
      post :review
    end
    resources :likes, only: :create
  end
end
