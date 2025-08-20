Rails.application.routes.draw do
  # Legacy routes - TODO: Remove these once all references are updated
  get 'plantations/new'
  get 'plantations/create'
  get 'plantations/destroy'
  get 'gardens/new'
  
  # Devise authentication routes - handles user registration, login, logout, etc.
  devise_for :users
  
  # Health check endpoint for monitoring and load balancers
  # Returns 200 if app boots successfully, 500 otherwise
  get "up" => "rails/health#show", as: :rails_health_check

  # Root route - landing page shows user's gardens
  root "gardens#index"

  # Nested resource structure: gardens contain plantations
  # This creates routes like:
  # - GET /gardens (index)
  # - GET /gardens/:id (show) 
  # - GET /gardens/new (new)
  # - POST /gardens (create)
  # - GET /gardens/:id/edit (edit)
  # - PATCH/PUT /gardens/:id (update)
  # - DELETE /gardens/:id (destroy)
  # - GET /gardens/:garden_id/plantations/new (nested new)
  # - POST /gardens/:garden_id/plantations (nested create)
  # - DELETE /gardens/:garden_id/plantations/:id (nested destroy)
  resources :gardens do
    resources :plantations, only: [:new, :create, :show, :destroy]
  end
  
  # Plant management routes (admin/seeding purposes)
  # Creates standard CRUD routes for plant catalog management
  resources :plants

  # Settings routes for user profile management
  # Allows users to manage profile pictures, passwords, and email addresses
  get 'settings', to: 'settings#show'
  patch 'settings/profile', to: 'settings#update_profile', as: 'update_profile_settings'
  delete 'settings/photo', to: 'settings#remove_photo', as: 'remove_photo_settings'
  patch 'settings/password', to: 'settings#update_password', as: 'update_password_settings'
  patch 'settings/email', to: 'settings#update_email', as: 'update_email_settings'
  patch 'settings/theme', to: 'settings#update_theme', as: 'update_theme_settings'
end
