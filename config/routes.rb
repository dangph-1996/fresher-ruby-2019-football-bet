Rails.application.routes.draw do
  namespace :admin do
    get 'matches/new'
  end
  root "home#index"
  devise_for :users,
    controllers:{ omniauth_callbacks:"users/omniauth_callbacks" }

  resources :users, only: %i(show)
  namespace :admin do
    get "index"
    resources :users
    resources :categories
    resources :newspapers
    resources :leagues
    resources :seasons
    resources :rounds do
      resources :matches
    end
    resources :football_clubs
  end
  get "categories/new"
  mount Ckeditor::Engine => '/ckeditor'
  get "/categories", to: "home#index"
  get "/search", to:"newspapers#search"
  resources :categories
  resources :newspapers
end
