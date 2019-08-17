Rails.application.routes.draw do
  get 'newspapers/new'
  root "home#index"
  devise_for :users,
    controllers:{ omniauth_callbacks:"users/omniauth_callbacks" }

  resources :users, only: %i(show)
  namespace :admin do
    get "index"
    resources :users
    resources :categories
    resources :newspapers
  end
  mount Ckeditor::Engine => '/ckeditor'
  get "/categories", to: "home#index"
  resources :categories
  resources :newspapers
end
