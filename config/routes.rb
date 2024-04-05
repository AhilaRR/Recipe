Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Root path of your application
  root 'recipes#index'

  # Routes for recipes, with nested routes for comments
  resources :recipes do
    resources :comments, only: [:create] do
      get 'destroy', on: :member
    end
  end

  # Routes for categories
  resources :categories, only: [:index, :new, :create, :show]

  # Singular resource for profile as each user has only one profile
  # Assuming the profile is managed under a user's scope
  resource :profile, only: [:show, :edit, :update]

  # Or if you want profiles to be directly associated with user IDs in the route:
  # resources :users do
  #   resource :profile, only: [:show, :edit, :update]
  # end
end
