Rails.application.routes.draw do
  get "health" => "rails/health#show", as: :rails_health_check

  resources :admin, only: :index

  namespace :admin, only: :index do
    resources :levels
    resources :lessons
    resources :vocabulary_items
    resources :questions    
  end

  resources :learn, only: :index do
    resources :levels
    resources :lessons
    resources :vocabulary_items
    resources :questions    
  end
  
  # Defines the root path route ("/")
  # root "posts#index"
end
