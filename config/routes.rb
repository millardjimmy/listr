Rails.application.routes.draw do

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [] do
    resources :categories, only: [:new, :edit, :create, :update, :destroy, :show] do
      resources :lists, only: [:new, :edit, :create, :update, :destroy, :show] do
        resources :tasks, only: [:new, :edit, :create, :update, :destroy]


      end
    end
  end
  
  # resources :tasks
  # resources :tags
  # resources :cotegories
  # resources :comments
  # resources :users
  # resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/users/:id', to: 'application#show', as: 'user'
  # root 'application#hello'
end
