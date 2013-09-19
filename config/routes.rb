StackRails::Application.routes.draw do

  resources :users, only: [:show, :new, :create]

  resources :sessions, only: [:create]

  resources :posts, only: [:new, :create, :show]

  match '/signout', :to => 'sessions#destroy'

  root to: "posts#index"
end
