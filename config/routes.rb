Rails.application.routes.draw do

  resources :book_posts
  resources :pages

  root 'pages#index'
  devise_for :users

  resources :admin, only: [:index, :create, :update, :destroy]

  # get 'admin/index'
  # post '/admin/users', to: 'admin#create', as: 'admin_users'
  # patch '/admin/users/:id', to: 'admin#update', as: 'admin_user'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
