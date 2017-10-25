# frozen_string_literal: true

Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'

  get 'auth/failure', to: redirect('/')
end
