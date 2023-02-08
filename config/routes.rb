# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:new]
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "users#index"

  # Defines the root path route ("/")
  # root "articles#index"
end
