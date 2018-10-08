Rails.application.routes.draw do
  root 'static_pages#index'

  resources :tutors

  namespace :student do
    resources :lessons
  end
end
