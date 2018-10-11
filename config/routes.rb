Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static_pages#index'

  resources :tutors

  namespace :student do
    resources :lessons
  end
end
