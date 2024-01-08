Rails.application.routes.draw do
  get "health" => "rails/health#show", as: :rails_health_check

  resources :admin, only: :index
  namespace :admin do
    resources :levels
    resources :lessons
    resources :vocabulary_items
    resources :grammar_items
    resources :questions    
  end

  resources :learn, only: :index
  scope 'learn/:level_slug', module: 'learn' do
    resources :lessons, param: :lesson_slug, only: %i[index show] do
      member do
        resources :vocabulary, only: :index
        resources :grammar,    only: :index
        resources :test,       only: :index
        resources :practice,   only: :index
      end
    end
  end
  
  root to: redirect('/learn')
end
