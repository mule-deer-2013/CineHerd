StackRails::Application.routes.draw do

  resources :users, only: [:show, :new, :create]

  resources :sessions, only: [:create]

  resources :posts, only: [:new, :create, :show] do
  resources :comments, only: [:new, :create]

  resources :abouts, only: [:show]

  end
  match '/signout', :to => 'sessions#destroy'
  match '/layouts/about', :to => 'abouts#show'

  root to: "posts#index"
end
