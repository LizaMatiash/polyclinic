Rails.application.routes.draw do
  devise_for :doctors, path: 'doctors', controllers: {
    sessions: 'doctors/sessions'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  # resources :appointments, only: [:show]
  namespace :users do
    resources :appointments, only: %i[show create]
    resource :profile, only: %i[show]
  end

  namespace :doctors do
    resources :appointments, only: %i[index edit create update]
    resource :profile, only: %i[show]
  end

  resource :search_doctor, only: %i[new show edit create] do
    post '/', to: 'search_doctors#find'
  end

  root to: "home#index"
end
