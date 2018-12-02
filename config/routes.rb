Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static_pages#index'

  namespace :student do
    resources :tutors
    resources :lessons
    resources :lesson_dates_options
  end

  resources :lessons do
    member do
      get 'video_chat'
    end
  end
end
