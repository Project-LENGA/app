Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'

  resources :tutors

  namespace :student do
    resources :lessons
  end
end
