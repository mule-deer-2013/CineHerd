StackRails::Application.routes.draw do

  resources :users, only: [:show, :new, :create]

  resources :sessions, only: [:create]

  resources :posts, only: [:new, :create, :show] do
    resources :comments, only: [:new, :create]
    resources :abouts, only: [:show]
  end

  resources :votes, :only => [:create]

  match '/votesup', :to => 'votes#createup'
  match '/votesdown', :to => 'votes#createdown'
  match '/signout', :to => 'sessions#destroy'
  match '/pages/about', :to => 'pages#show'

  root to: "posts#index"
end
