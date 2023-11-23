Rails.application.routes.draw do
  get "health" => "rails/health#show", as: :rails_health_check

  resources :admin, only: :index

  namespace :admin do
    resources :levels
    resources :lessons
    resources :vocabulary_items
    resources :questions    
  end

  namespace :learn do
    resources :levels
    resources :lessons
    resources :vocabulary_items
    resources :questions    
  end
  
  # Defines the root path route ("/")
  # root "posts#index"
end
