Rails.application.routes.draw do
  get 'plantations/new'
  get 'plantations/create'
  get 'plantations/destroy'
  get 'gardens/new'
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "gardens#index"

  resources :gardens do
    resources :plantations, only: [:new, :create, :show, :destroy]
  end
  resources :plants
end
