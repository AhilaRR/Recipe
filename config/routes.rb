Rails.application.routes.draw do
  # Root path of your application
  root 'recipes#index'

  # Devise routes for standard HTML interactions
  devise_for :users

  # Standard HTML routes for recipes, comments, categories, and profiles
  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end

  resources :categories, only: [:index, :new, :create, :show]

  resource :profile, only: [:show, :edit, :update]

  # API routes under the namespace 'api/v1'
  namespace :api do
    namespace :v1 do
      # Devise routes for API, adjusting paths and pointing to specific controllers
      devise_for :users, controllers: {
        sessions: 'api/v1/sessions',
        registrations: 'api/v1/registrations'
      }, path: '', path_names: {
        sign_in: 'signin',
        sign_out: 'signout',
        registration: 'signup'  # Explicitly define the path name for user registration
      }, skip: [:omniauth_callbacks, :passwords, :confirmations, :unlocks]

      # API resource routes
      resources :recipes, controller: 'recipes' do
        resources :comments, only: [:create, :destroy], controller: 'comments'
      end
      resources :categories, only: [:index, :show], controller: 'categories'
      resource :profile, only: [:show, :update], controller: 'profiles'
    end
  end
end
