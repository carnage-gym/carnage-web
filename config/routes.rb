Rails.application.routes.draw do
  resources :routines
  get 'welcome/index'
  get '/about', to: "welcome#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/logbook', to: "welcome#logbook", as: "logbook"

  resources :workouts, only: [:destroy, :create, :update, :view, :edit]

  resources :exercises do
    resources :exercise_sets, only: [:destroy, :create, :edit, :update]
  end

  namespace :api do
    resources :routines, only: [:index, :create, :update, :destroy]
    resources :profiles, only: [:index, :show]
  end

  resources :routines do
    patch 'edit/add_exercise', to: "routines#add_exercise", as: "add_exercise"
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "welcome#index"
  devise_for :users, :controllers => { registrations: 'users/registrations' }
end
