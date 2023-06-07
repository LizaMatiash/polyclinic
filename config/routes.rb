Rails.application.routes.draw do
  devise_for :doctors, path: 'doctors'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    appointments: 'users/appointments'
  }

  # resources :appointments, only: [:show]
  namespace :user do
    resources :appointments, only: [:show]
  end


  resource :search_doctor, only: %i[new show edit create] do
    post '/', to: 'search_doctors#find'
  end

  resource :profile, only: %i[show]

  root to: "home#index"
end
