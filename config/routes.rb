Rails.application.routes.draw do
  resources :exercise_sets, only: [:create, :update, :destroy]
  resources :routines, except: [:create] do
    post "add_exercise", to: "routines#add_exercise"
    post "remove_exercise", to: "routines#remove_exercise"
    post "add_exercise_set", to: "routines#add_exercise_set"
    post "remove_exercise_set", to: "routines#remove_exercise_set"
  end
  resources :exercises
  resource :session
  resources :passwords, param: :token
  resources :registrations, only: [:new, :create]
  resources :users, only: [:show, :index, :edit, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  get "home/index", as: :home
  root "home#index"
end
