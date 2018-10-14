Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static_pages#index'


  namespace :student do
    resources :tutors
    resources :lessons
  end
end
