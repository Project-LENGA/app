Rails.application.routes.draw do
  get 'users/new'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static_pages#index'
  get  '/signup',  to: 'users#new'
  resources :users


  namespace :student do
    resources :tutors
    resources :lessons
  end

  resources :lessons do
    member do
      get 'video_chat'
    end
  end
end
