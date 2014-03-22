HoneHouse::Application.routes.draw do
  devise_for :users
  resources :courses
  root to: 'courses#index'
end
