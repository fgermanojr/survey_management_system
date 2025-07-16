Rails.application.routes.draw do
  # get "surveys/new"
  # get "surveys/create"
  # get "surveys/index"
  # get "surveys/show"
  # get "surveys/edit"
  # get "surveys/update"
  resources :surveys
  get "surveys/take"
  get "user_sessions/new"
  get "user_sessions/create"
  # get "users/index"
  # get "users/new"
  # get "users/create"
  resources :users, only: [:index, :new, :create]
  resources :questions
  resources :options
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root "user_sessions#new"
end
