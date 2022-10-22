Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users, only: %i(index show)
  resources :follow_relationships, only: [:create, :destroy]
end
