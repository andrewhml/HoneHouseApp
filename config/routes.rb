HoneHouse::Application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :courses
  root to: 'courses#index'
end
