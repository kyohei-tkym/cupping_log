Rails.application.routes.draw do
  root to: 'homes#top'

  resources :users, only: [:show, :edit, :update]

  devise_for :users

  resources :logs
end
