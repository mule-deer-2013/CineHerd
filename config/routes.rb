StackRails::Application.routes.draw do

  resources :users, only: [:show, :new, :create]

  resources :posts, only: [:index]
  
  root to: "posts#index"
end
