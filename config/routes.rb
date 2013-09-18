StackRails::Application.routes.draw do

  resources :users, only: [:show, :new, :create]

  resources :sessions, only: [:create, :destroy]

  resources :posts, only: [:new, :create]

  root to: "posts#index"
end
