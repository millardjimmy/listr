Rails.application.routes.draw do
  resources :tasks
  resources :tags
  resources :cotegories
  resources :comments
  resources :users
  resources :lists
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
