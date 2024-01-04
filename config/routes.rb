Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  resources :registrations, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  root "welcome#index"
end
