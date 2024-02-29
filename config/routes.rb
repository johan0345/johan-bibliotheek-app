Rails.application.routes.draw do

  resources :book_posts
  resources :pages

  root 'pages#index'

  devise_for :users, controllers: { 
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  } do
  end

  get 'enable_otp_show_qr', to: 'users#enable_otp_show_qr', as: 'enable_otp_show_qr'
  post 'enable_otp_verify', to: 'users#enable_otp_verify', as: 'enable_otp_verify'

  get 'users/otp', to: 'users#show_otp', as: 'user_otp'
  post 'users/otp', to: 'users#verify_otp', as: 'verify_user_otp'
  post 'verify_otp', to: 'users/sessions#verify_otp'

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
