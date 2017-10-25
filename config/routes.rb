# frozen_string_literal: true

Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  delete 'session', to: 'sessions#destroy', as: 'destroy_user_session'

  resources :tweets, only: %i[index create]
  resources :sessions, only: %i[new create verify destroy] do
    collection do
      post 'verify'
    end
  end

  root to: 'tweets#index'
end
