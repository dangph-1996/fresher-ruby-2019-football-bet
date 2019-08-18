Rails.application.routes.draw do
  get 'newspapers/new'
  root "home#index"
  devise_for :users,
    controllers:{ omniauth_callbacks:"users/omniauth_callbacks" }

  resources :users, only: %i(show)
  namespace :admin do
    get "index"
    resources :users
<<<<<<< HEAD
<<<<<<< HEAD
    resources :categories
    resources :newspapers
  end
<<<<<<< HEAD
  get "categories/new"
=======
  end
>>>>>>> Manage User
=======
    resources :categories
  end
  get "categories/new"
>>>>>>> Manage Categories
=======
  mount Ckeditor::Engine => '/ckeditor'
  get "/newspaper", to:"newspapers#show"
>>>>>>> Manage News
end
