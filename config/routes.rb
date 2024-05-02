Rails.application.routes.draw do
  resources :comments
  get 'contact/contact'
  root to: 'home#index'
  get 'home/:first_name', to: 'home#index'
  get 'home', to: 'home#index', as: 'home'
  get 'contact', to: 'contact#contact'
  get 'team', to: 'team#team'

  resources :gossips do
    resources :comments
  end
  resources :users
  resources :cities



  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
