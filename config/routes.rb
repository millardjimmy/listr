Rails.application.routes.draw do
  # Home Page
  root 'static#home'

  # Signup
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # Signout
  delete '/signout' => 'sessions#destroy'

  # Signin
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  # Google Auth
  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  get '/categories/popular', to: 'categories#popular', as: 'popular'

  # Nested Route
  resources :categories, only: [:index, :new, :create] do
    resources :questions, only: [:index, :new, :create]
  end

  resources :users, only: [:index, :new, :create, :show]
    #resources :questions, only: [:edit, :destroy]
  


  resources :questions do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
