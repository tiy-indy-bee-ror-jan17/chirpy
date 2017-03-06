Rails.application.routes.draw do
  resources :follows, only: [:create, :destroy]
  resources :posts, only: [:create, :index]
  resources :users, only: [:create, :index]
  post "/login" => 'sessions#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
