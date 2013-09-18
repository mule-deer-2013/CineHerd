StackRails::Application.routes.draw do

  resources :posts, only: [:index]
  root to: "posts#index"
end
