Rails.application.routes.draw do
  root 'static_pages#top'

  get '/privacy', to: 'static_pages#privacy'
  get '/teams', to: 'static_pages#teams'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  post "oauth/callback", to: "oauths#callback"
  get "oauth/callback", to: "oauths#callback"
  get "oauth/:provider", to: "oauths#oauth", as: :auth_at_provider

  resources :users, only: %i[new create]
  resources :flowers do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :favorites
    end
  end
  resources :unknown_flowers
  resources :favorites, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
end
