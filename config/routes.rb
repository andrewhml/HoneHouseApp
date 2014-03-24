HoneHouse::Application.routes.draw do
  devise_for :users
  resources :users, only: :show
  resources :courses do
    resources :units, only: [:new, :create, :edit, :update]
  end

  resources :units, only: :destroy
  root to: 'courses#index'

  get '/courses/:course_id/unit/:unit_id/lesson', to: 'lessons#new', as: 'new_lesson'
  resources :lessons, except: :index
end
