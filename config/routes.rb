Rails.application.routes.draw do
  namespace :admin do
    get 'players/new'
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
    resources :rounds
    resources :football_clubs
    resources :players
  end
  get "categories/new"
  mount Ckeditor::Engine => '/ckeditor'
  get "/newspaper", to:"newspapers#show"
  get "/categories", to: "home#index"
  resources :categories
  resources :newspapers
end
