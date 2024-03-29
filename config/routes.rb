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
  get "flowers/post", to: "flowers#post"

  resources :users, only: %i[new create]
  resources :flowers do
    resources :comments, only: %i[create destroy], shallow: true
    collection do
      get :favorites
      get 'search'
    end
  end
  resources :favorites, only: %i[create destroy]
  resources :unknown_flowers do
    resources :answers, only: %i[create destroy], shallow: true
    collection do
      get :receptions
    end
  end
  resources :receptions, only: %i[create destroy]
  resource :profile, only: %i[show edit update]
end
